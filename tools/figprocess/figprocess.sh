#!/bin/bash

if [ $# -eq 0 ]
then
    echo "Usage: $0 <pdf-file>"
    exit 1
fi

for var in "$@"
do
    x=${var%.pdf}
    pdfcrop $x.pdf &>/dev/null \
        && mv $x-crop.pdf $x.pdf &>/dev/null
    echo "processed $x"
done
