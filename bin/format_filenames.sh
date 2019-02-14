#!/bin/sh

# Replaces special characters with hyphens in filenames.
#
# Example:
#   osu!_beatmap+-+(filters).png
#   osu-beatmap-filters-.png

files=$(find ../wiki -name '*[\?!|\*+=<>:;"_ &^%$#\{\}\[\](),.]*.*' ! -name '*.md' -print)

while read -r filename; do
    new_basename=$(sed -e 's/[\?!\|\*\+=<>:;"_ &^%\$#\{\}\[\]\(\),.-]+/-/g' $(basename "$filename"))
    new_filename=$(dirname "$filename")"$new_basename"

    find . -name '*.md' -exec sed -i -e "s/$old_filename/$new_filename/g" {} +
done <<< "$files"
