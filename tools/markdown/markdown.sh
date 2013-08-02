#!/bin/bash

# Paths and settings
PANDOC=pandoc
WEASYPRINT=weasyprint
STYLESHEET="$TOOLS_ROOT/markdown/print.css"

# Handle input / output.
input=$1
output=$2
if [ -z $output ]; then
  output=${input%.*}.pdf
fi

# `--smart` transforms `---` into &mdash; and other niceties.
# `--standalone` embeds into standalone HTML doc (<html> root).
# The `sed` line adds a lang attribute to <html> (needed for hyphenation).
$PANDOC --from markdown --to html5 --smart --standalone $input \
  | sed -e 's/^<html>$/<html lang="en">/' \
  | $WEASYPRINT -e utf8 - $output -s $STYLESHEET

echo "output written to $output"
