#! /usr/bin/env RScript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Get Seed
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName athcast
# @raycast.icon 🌱

# Documentation:
# @raycast.author Andrew Heiss
# @raycast.authorURL https://www.andrewheiss.com
# @raycast.description Generate a random seed from random.org

library(httr2)

seed <- request(
  "https://www.random.org/integers/?num=1&min=100000&max=999999&col=1&base=10&format=plain&rnd=new"
) |>
  req_method("GET") |>
  req_perform() |>
  resp_body_string(encoding = "UTF-8")

seed <- gsub("[\r\n]", "", seed)

clipr::write_clip(seed, object_type = "character", allow_non_interactive = TRUE)
glue::glue("{seed} copied to clipboard")
