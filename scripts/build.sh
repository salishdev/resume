#!/usr/bin/env bash

docker build -t resume-builder .

CID=$(docker create resume-builder)
mkdir -p build
docker cp "$CID:/data/resume.pdf" build/resume.pdf
docker cp "$CID:/data/resume.json" build/resume.json
# docker cp "$CID:/data/resume.tex" latex/resume.tex
docker rm "$CID"
