#!/usr/bin/env bun
/**
 * Render resume.tex from YAML data and Pug template
 */

import * as yaml from "js-yaml";
import * as pug from "pug";
import { readFileSync, writeFileSync } from "fs";

function main() {
  // Load YAML data
  const yamlContent = readFileSync("./data/resume.yaml", "utf8");
  const data = yaml.load(yamlContent) as any;

  // Compile and render Pug template
  const compiledFunction = pug.compileFile("./latex/resume.tex.pug");
  const rendered = compiledFunction(data);

  // Write output
  writeFileSync("./latex/resume.tex", rendered);

  console.log("✓ Rendered resume.tex from resume.yaml and resume.tex.pug");
  return 0;
}

process.exit(main());
