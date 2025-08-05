#!/usr/bin/env bun
/**
 * Render resume.tex from YAML data and Mustache template
 */

import * as yaml from "js-yaml";
import Mustache from "mustache";
import { readFileSync, writeFileSync } from "fs";

function main() {
  // Load YAML data
  const yamlContent = readFileSync("./data/resume.yaml", "utf8");
  const data = yaml.load(yamlContent) as any;

  // Use custom Mustache tags to prevent ambiguity with LaTeX syntax
  Mustache.tags = ["<%", "%>"];

  // Don't escape HTML entities
  Mustache.escape = (text) => text;

  // Render Mustache template
  const template = readFileSync("./latex/resume.tex.mustache", "utf8");
  const rendered = Mustache.render(template, data);

  // Write output
  writeFileSync("./latex/resume.tex", rendered);

  console.log("✓ Rendered resume.tex from resume.yaml and resume.tex.mustache");
  return 0;
}

process.exit(main());
