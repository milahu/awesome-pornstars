#!/usr/bin/env bash

set -eu

bookmarks_html_path="$1"

grep_args=(
  -e "https://www\.pornhub\.com/view_video\.php"
)

echo "<ul>"

cat "$bookmarks_html_path" |
  pandoc --wrap=none -f html -t commonmark |
  grep "${grep_args[@]}" |
  sed 's|<a.*>|<li>&</li>|' |
  sed -E 's/ data-icon="[^"]+"//'

echo "</ul>"
