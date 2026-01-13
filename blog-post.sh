#!/usr/bin/env bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Create new Quarto blog post
# @raycast.mode silent

# Optional parameters:
# @raycast.argument1 { "type": "text", "placeholder": "Project folder name" }
# @raycast.icon 👨‍💻

# Documentation:
# @raycast.description Create ~/Sites/ath-quarto/blog/YYYY/MM/DD/<folder> and open in Positron
# @raycast.author andrewheiss

# Check if folder name is provided
if [ -z "$1" ]; then
  echo "Error: No folder name provided"
  exit 1
fi

# Get the current date in MM/DD format
current_date=$(date +%Y/%m/%d)

# And get it as ISO-8601 for the YAML
yaml_date=$(date +%Y-%m-%d)

# Build the full path
full_path="$HOME/Sites/ath-quarto/blog/$current_date/$1"

# Create the directory
mkdir -p "$full_path"

# Create index.qmd with template
cat > "$full_path/index.qmd" << EOF
---
title: "TITLE HERE"
date: $yaml_date
description: "DESCRIPTION HERE (150-160 characters)"

image: "img/BLAH.png"
twitter-card:
  image: "img/BLAH.png"
open-graph:
  image: "img/BLAH.png"

categories:
  - SOMETHING

# doi: DOI HERE
citation: true
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
