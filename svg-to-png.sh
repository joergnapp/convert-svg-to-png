#!/bin/bash

# see https://gist.github.com/mohanpedala/1e2ff5661761d3abd0385e8223e16425
set -euxo pipefail
IFS=$'\n\t'

SVGPATH=${1:-"svg/"}
PNGPATH=${2:-"png/"}
ZOOM=${3:-1}

# create directory to store pngs
mkdir -p "$PNGPATH"

# search fpr SVGs
FILES=$(find "${SVGPATH}" -maxdepth 1 -type f -iname '*.svg')

echo "$FILES" | while read -r INFILE
do
    OUTFILE=$(echo "$INFILE" | sed "s!^${SVGPATH}!${PNGPATH}!" | sed "s!.svg\$!.png!I")
    rsvg-convert -z"$ZOOM" "$INFILE" -o "$OUTFILE" 
done
