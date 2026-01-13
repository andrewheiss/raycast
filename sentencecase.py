#!/usr/bin/env python
# -*- coding: utf-8 -*-

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Sentence case
# @raycast.mode inline
# @raycast.packageName Change Case

# Optional parameters:
# @raycast.icon ./images/titlecase-light.png
# @raycast.iconDark ./images/titlecase-dark.png

# Documentation:
# @raycast.author Andrew Heiss
# @raycast.authorURL https://www.andrewheiss.com
# @raycast.description Change clipboard text to sentence case

import subprocess
from nltk.tokenize import sent_tokenize

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
    except:
        return s

def tryEncode(s):
    try:
        return s.encode('utf-8')
    except:
        return s

def capitalizeSentence(s):
    # Tokenize with nltk magic
    sentences = sent_tokenize(s)

    # Capitalize the first word of each sentence
    capitalized_sentences = [sentence.capitalize() for sentence in sentences]

    # Join the sentences back into a single string
    result = ' '.join(capitalized_sentences)
    
    return result

clipboard = str(getClipboardData())
result = capitalizeSentence(clipboard)
setClipboardData(result)
print(result)
