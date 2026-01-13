#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Create Positron playground project
# @raycast.mode silent

# Optional parameters:
# @raycast.argument1 { "type": "text", "placeholder": "Project folder name" }
# @raycast.icon 🛝

# Documentation:
# @raycast.description Create ~/Development/• Mini projects/• 2025 playground/MM/DD/<folder> and open in Positron
# @raycast.author andrewheiss

# Check if folder name is provided
if [ -z "$1" ]; then
  echo "Error: No folder name provided"
  exit 1
fi

# Get the current date in MM/DD format
current_date=$(date +%m/%d)

# And get it as ISO-8601 for the YAML
yaml_date=$(date +%Y-%m-%d)

# Build the full path
full_path="$HOME/Development/• Mini projects/• 2025 playground/$current_date/$1"

# Create the directory
mkdir -p "$full_path"

# Create index.qmd with template
cat > "$full_path/index.qmd" << EOF
---
title: "TITLE HERE"
author: "Andrew Heiss"
date: $yaml_date
---

\`\`\`{r}
#| label: setup
#| include: false

knitr::opts_chunk\$set(
  fig.width = 6,
  fig.height = 6 * 0.618,
  fig.retina = 3,
  dev = "ragg_png",
  fig.align = "center",
  out.width = "90%",
  collapse = TRUE,
  cache.extra = 1234  # Change number to invalidate cache
)

options(
  digits = 4,
  width = 300,
  dplyr.summarise.inform = FALSE
)
\`\`\`

CONTENT HERE
EOF

# Open the folder in Positron
positron "$full_path"
