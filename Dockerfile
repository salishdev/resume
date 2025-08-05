# Stage 1: Render template with Bun
FROM oven/bun:alpine AS renderer

WORKDIR /app

# Copy package files
COPY package.json ./

# Install dependencies
RUN bun install

# Copy source files
COPY src/ ./src
COPY data/ ./data
COPY latex/ ./latex

# Render the template
RUN bun start

# Stage 2: Generate PDF with LaTeX
FROM kjarosh/latex:2025.1-small AS latex

# Install additional fonts for resumes
RUN tlmgr update --self && \
  tlmgr install \
  libertine \
  inconsolata \
  lato \
  mweights \
  fontaxes \
  libertinus \
  # caslon \
  # gotham \
  libertinus-fonts \
  libertinus-otf \
  ebgaramond \
  ebgaramond-maths \
  crimson \
  crimsonpro \
  cochineal \
  newtx \
  newpx \
  sourceserifpro \
  sourcesanspro

# Create working directory
WORKDIR /data

# Copy rendered latex files from previous stage
COPY --from=renderer /app/latex/ ./

# Generate PDF
RUN lualatex --interaction=nonstopmode --file-line-error resume.tex
