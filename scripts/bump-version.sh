#!/bin/sh
# Give the game a new version number, in both index.html and version.json.
# Open games check version.json every minute and reload into the new version,
# so run this before every commit that changes the game.
set -e
cd "$(dirname "$0")/.."
v=$(date -u +%Y%m%d%H%M%S)
sed -i.bak \
  -e "s/const GAME_VERSION='[^']*'/const GAME_VERSION='$v'/" \
  -e "s/<p class=\"ver\">Version [^<]*</<p class=\"ver\">Version $v</" \
  index.html
rm index.html.bak
printf '{"version": "%s"}\n' "$v" > version.json
echo "$v"
