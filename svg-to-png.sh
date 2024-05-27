#!/bin/bash

set -euxo pipefail
IFS=$'\n\t'

SVGPATH=${1:-"svg/"}
PNGPATH=${2:-"png/"}
ZOOM=${3:-1}

FILES=$(find "${SVGPATH}" -maxdepth 1 -type f -iname '*.svg')

echo "$FILES" | while read -r INFILE
do
    OUTFILE=$(echo "$INFILE" | sed "s!^${SVGPATH}!${PNGPATH}!" | sed "s!.svg\$!.png!I")
    rsvg-convert -z"$ZOOM" "$INFILE" -o "$OUTFILE" 
done
