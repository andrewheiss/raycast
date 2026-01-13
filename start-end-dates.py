#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Date cells to YAML
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🗓️

# Documentation:
# @raycast.author Andrew Heiss
# @raycast.authorURL https://www.andrewheiss.com
# @raycast.description Change tab-separated dates in clipboard to YAML

import subprocess
import sys

def getClipboardData():
    p = subprocess.Popen(["pbpaste"], stdout=subprocess.PIPE)
    data = p.stdout.read()
    return tryDecode(data)

def setClipboardData(data):
    p = subprocess.Popen(["pbcopy"], stdin=subprocess.PIPE)
    p.stdin.write(tryEncode(data))
    p.stdin.close()

def tryDecode(s):
    try:
        return s.decode('utf-8')
    except UnicodeDecodeError:
        return s

def tryEncode(s):
    try:
        return s.encode('utf-8')
    except UnicodeDecodeError:
        return s

clipboard = str(getClipboardData())

# Split by tab to get the two dates
dates = clipboard.split('\t')

# Make sure it worked
if len(dates) != 2:
    print("Error: Expected exactly 2 tab-separated dates")
    sys.exit(1)

start_date, end_date = dates

# Create YAML version
yaml_output = f'date: "{start_date}"\ndate_end: "{end_date}"'

setClipboardData(yaml_output)
print(yaml_output)

# subprocess.run(['osascript', '-e', 'tell application "System Events" to keystroke the clipboard as text'])
