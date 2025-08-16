#!/usr/bin/env bun
/**
 * Render resume.tex from YAML data and Mustache template
 */

// use utc timezone
process.env.TZ = "Etc/UTC";

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
  const rendered = Mustache.render(template, mapData(data));

  // Write LaTeX output
  writeFileSync("./latex/resume.tex", rendered);

  // Write JSON output
  writeFileSync("./data/resume.json", JSON.stringify(data, null, 2));

  console.log("✓ Rendered resume.tex from resume.yaml and resume.tex.mustache");
  console.log("✓ Converted resume.yaml to resume.json");
  return 0;
}

function formatMonthYear(dateString: string): string {
  if (!dateString) return "";

  const date = new Date(dateString);
  return date.toLocaleDateString("en-US", {
    year: "numeric",
    month: "short",
  });
}

function formatYear(dateString: string): string {
  if (!dateString) return "";
  const date = new Date(dateString);
  return date.toLocaleDateString("en-US", { year: "numeric" });
}

function formatDuration(
  startDate: string,
  endDate: string,
  format: "year" | "monthYear" = "monthYear",
): string {
  if (!startDate) return "";

  const start =
    format == "year" ? formatYear(startDate) : formatMonthYear(startDate);
  const end = format == "year" ? formatYear(endDate) : formatMonthYear(endDate);

  if (startDate === endDate) {
    return start;
  }

  return `${start} --- ${end || "Present"}`;
}

function mapData(data: any): any {
  const mapped = {
    ...data,
    basics: {
      ...data.basics,
      urlLabel: data.basics?.url?.replace(/^https?:\/\//, ""),
      phoneClean: data.basic?.phone?.replace(/\D/g, ""),
      profiles: data.basics.profiles.map((profile: any) => ({
        ...profile,
        urlLabel: profile.url?.replace(/^https?:\/\//, ""),
      })),
    },
    work: data.work.map((work: any) => ({
      ...work,
      duration: formatDuration(work.startDate, work.endDate),
    })),
    skills: data.skills.map((skill: any) => ({
      ...skill,
      name: skill.name.replace("&", "\\&"),
      keywords: skill.keywords.join(", "),
    })),
    education: data.education.map((education: any) => ({
      ...education,
      duration: formatDuration(education.startDate, education.endDate, "year"),
    })),
    projects: data.projects?.map((project: any) => ({
      ...project,
      duration: formatDuration(project.startDate, project.endDate, "monthYear"),
    })),
  };

  console.log(mapped);
  return mapped;
}

process.exit(main());
