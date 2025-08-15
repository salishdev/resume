#!/usr/bin/env bash

docker build -t resume-builder .

CID=$(docker create resume-builder)
docker cp "$CID:/data/resume.pdf" resume.pdf
docker cp "$CID:/data/resume.json" resume.json
# docker cp "$CID:/data/resume.tex" latex/resume.tex
docker rm "$CID"
