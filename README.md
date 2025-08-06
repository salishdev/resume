# Resume Builder

A modern, automated resume generation system that transforms YAML data into a beautifully formatted PDF resume using LaTeX typesetting.

## Overview

This project provides a streamlined workflow for maintaining and generating professional resumes. It separates content from presentation by storing resume data in a structured YAML format and using a Mustache template system to generate LaTeX documents, which are then compiled into high-quality PDFs.

## Features

- **Data-Driven**: Resume content stored in YAML format following JSON Resume schema
- **Template-Based**: Customizable LaTeX templates using Mustache templating engine
- **Automated Build**: Docker-based build system for consistent PDF generation
- **TypeScript Processing**: Data transformation and formatting logic written in TypeScript
- **Professional Output**: High-quality PDF output using LaTeX typesetting with custom resume class

## Technology Stack

- **Bun**: JavaScript runtime for template processing
- **TypeScript**: Type-safe data transformation
- **Mustache**: Logic-less templating for LaTeX generation
- **LaTeX (LuaLaTeX)**: Professional typesetting system
- **Docker**: Containerized build environment for reproducibility
- **YAML**: Human-readable data format for resume content

## Project Structure

```
resume/
├── data/
│   └── resume.yaml          # Resume content in YAML format
├── latex/
│   ├── resume.cls           # Custom LaTeX document class for resumes
│   ├── resume.tex.mustache  # Mustache template for LaTeX generation
│   └── resume.tex           # Generated LaTeX file (build artifact)
├── scripts/
│   └── build.sh            # Build script for Docker-based PDF generation
├── src/
│   └── index.ts            # TypeScript template processor
├── Dockerfile              # Multi-stage Docker build configuration
├── package.json            # Node.js project configuration
├── tsconfig.json           # TypeScript configuration
└── resume.pdf              # Final PDF output (build artifact)
```

## Prerequisites

- **Docker**: For containerized PDF generation
- **Bun**: For local development and template processing
- **Node.js**: Alternative to Bun if preferred

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd resume
```

2. Install dependencies:
```bash
bun install
```

## Usage

### Quick Build

Generate the PDF resume using Docker:
```bash
./scripts/build.sh
```

This will:
1. Build a Docker container with all necessary dependencies
2. Process the YAML data through the Mustache template
3. Compile the LaTeX document to PDF
4. Copy the generated `resume.pdf` to the project root

### Development Workflow

1. **Edit Resume Content**: Modify `data/resume.yaml` with your information
2. **Customize Template**: Edit `latex/resume.tex.mustache` for layout changes
3. **Process Template**: Run `bun start` to generate `latex/resume.tex`
4. **Build PDF**: Execute `./scripts/build.sh` to create the final PDF

### Local Template Processing

To process the template without Docker:
```bash
bun run src/index.ts
```

This generates `latex/resume.tex` from the YAML data and Mustache template.

## Customization

### Resume Data

The `data/resume.yaml` file follows the JSON Resume schema structure with sections for:
- **basics**: Personal information and contact details
- **work**: Professional experience
- **education**: Academic background
- **skills**: Technical and professional skills
- **projects**: Notable projects and achievements

### LaTeX Template

The `latex/resume.tex.mustache` template uses custom Mustache tags (`<%` and `%>`) to avoid conflicts with LaTeX syntax. Key features:
- Automatic date formatting (Month Year format)
- Duration calculation for positions and education
- Clean URL formatting (removes protocol prefixes)
- Special character escaping for LaTeX

### Resume Class

The `latex/resume.cls` file defines the visual styling including:
- Font selection (EB Garamond by default)
- Section formatting and spacing
- Header and contact information layout
- Custom commands for resume entries

## Docker Build Process

The project uses a multi-stage Docker build:

1. **Stage 1 (Renderer)**: Bun Alpine container
   - Installs Node dependencies
   - Processes YAML data through Mustache template
   - Generates LaTeX file

2. **Stage 2 (LaTeX)**: LaTeX container
   - Installs required LaTeX packages
   - Compiles LaTeX to PDF using LuaLaTeX
   - Produces final PDF output

## Key Components

### Data Processing (`src/index.ts`)

- Loads and parses YAML resume data
- Formats dates to readable strings (e.g., "Jan 2024")
- Calculates duration strings for positions
- Escapes special LaTeX characters
- Renders Mustache template with processed data

### Build Script (`scripts/build.sh`)

- Creates Docker container from Dockerfile
- Extracts generated PDF from container
- Cleans up temporary containers

## Output

The final `resume.pdf` is a professionally typeset document suitable for:
- Job applications
- Professional portfolios
- Academic submissions
- LinkedIn profiles

## Contributing

Contributions are welcome! Please feel free to submit pull requests for:
- Template improvements
- Additional LaTeX styles
- Enhanced data processing
- Documentation updates

## License

[Specify your license here]

## Acknowledgments

- JSON Resume for the schema specification
- LaTeX community for the typesetting system
- Mustache for the templating engine