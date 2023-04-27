#!/bin/bash

# Send a request to the URL and store the response in a variable
response=$(curl -sI "$1")

# Extract the value of the Content-Length header from the response
content_length=$(echo "$response" | grep -i "Content-Length" | awk '{print $2}')

# Display the size of the body of the response in bytes
