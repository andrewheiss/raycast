#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Refresh Ubersicht widgets
# @raycast.mode silent
#
# Optional parameters:
# @raycast.packageName athcast
# @raycast.icon 🔄
#
# Documentation:
# @raycast.description This script refreshes all Uberishct widgets.
# @raycast.author Andrew Heiss
# @raycast.authorURL https://www.andrewheiss.com

tell application id "tracesOf.Uebersicht" to refresh

log "Übersicht widgets refreshed"
