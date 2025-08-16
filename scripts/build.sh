#!/usr/bin/env bash

docker build -t resume-builder .

CID=$(docker create resume-builder)
docker cp "$CID:/data/resume.pdf" public/resume.pdf
docker cp "$CID:/data/resume.json" public/resume.json
# docker cp "$CID:/data/resume.tex" latex/resume.tex
docker rm "$CID"
