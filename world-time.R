#!/usr/bin/env Rscript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title World times
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName athcast
# @raycast.icon 🌍

# Documentation:
# @raycast.author Andrew Heiss
# @raycast.authorURL https://www.andrewheiss.com
# @raycast.description Show the current time in different timezones

suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(lubridate))
library(purrr)
library(emoji)

show_time <- function(city, tz, flag) {
  time_there <- with_tz(now(), tzone = tz) |> 
    format("%H:%M")
  
  glue::glue(
    "{flag(flag)} {city} {time_there}"
  )
}

places <- dplyr::tribble(
  ~name, ~tz, ~flag,
  "Doha", "Asia/Qatar", "Qatar",
  "Atlanta", "US/Eastern", "United States",
  "Salt Lake City", "US/Mountain", "United States"
) |> 
  mutate(nice = pmap_chr(lst(name, tz, flag), \(name, tz, flag) show_time(name, tz, flag)))

cat(paste(places$nice, collapse = " · "))
