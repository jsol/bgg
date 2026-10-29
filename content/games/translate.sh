#!/bin/bash

while read game; do

  name=$(echo "$game" | cut -f 1)
  orig="$name"
  id=$(echo "$game" | cut -f 2 )

  name="${name// /_}"
  name="${name//[^[:alnum:_].]/}"
  name="${name,,?}"

  url="https://boardgamegeek.com/boardgame/$id"
  echo "$name  https://boardgamegeek.com/boardgame/$id"

   if [ ! -d "$DIRECTORY" ]; then
      cp -r ../template "$name"
      sed -i -e "s/NAME/$orig/g" "$name/index.md"
      sed -i -e "s|BGGURL|$url|g" "$name/index.md"
   fi
done < test.csv
