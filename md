#!/bin/sh

# Preview Markdown in w3m

pandoc $1 |w3m -T text/html
