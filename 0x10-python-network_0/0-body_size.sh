#!/bin/bash

url=$1

response=$(curl -s -w "%{http_code} %{content_type}\n" "$url")

status_code=$(echo "$response" | awk '{print $1}')
content_type=$(echo "$response" | awk '{print $2}')

if [[ $status_code -eq 200 && $content_type == "text/html"* ]]; then
  echo "$response" | sed '1d' | cat
