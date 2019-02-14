#!/bin/sh

# Standardizes table padding.
#
# Example:
#   | ----      | :---------|
#   | example   |  example  |
#
#   | --- | :-- |
#   | example | example |

osu_wiki_dir="$(dirname "$0")/.."

find "$osu_wiki_dir" -name '*.md' -exec sed -i \
    -e 's/|\(\| \{2,\}\)\([^| ][^|]*\) *|/| \2 |/g' \
    -e 's/| *\([^|]*[^| ]\)\(\| \{2,\}\)|/| \1 |/g' \
    -e 's/| \([:-]\)-\{2,\}\([:-]\) |/| \1-\2 |/g' \
    {} +
