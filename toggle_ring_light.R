#! /usr/bin/env RScript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle ring light
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName athcast
# @raycast.icon 💡

# Documentation:
# @raycast.author Andrew Heiss
# @raycast.authorURL https://www.andrewheiss.com
# @raycast.description Turn my home office ring light on or off

library(httr2)

req <- request(
  "http://10.10.10.5:8123/api/services/switch/toggle"
) |> 
  req_method("POST") |> 
  req_headers(
    "Authorization" = paste("Bearer", Sys.getenv("HOME_ASSISTANT_TOKEN")),
    "content-type" = "application/json"
  ) |> 
  req_body_json(list(
    entity_id = "switch.ring_light"
  )) |> 
  req_perform() |> 
  resp_body_json()

cat("Ring light toggled")
