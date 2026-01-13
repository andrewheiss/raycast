#!/usr/bin/env sh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Insert Zotero citation
# @raycast.mode compact

# Optional parameters:
# @raycast.icon “

curl "http://127.0.0.1:23119/better-bibtex/cayw?format=pandoc&clipboard=yes"
