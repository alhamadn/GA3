#!/bin/bash
set -euo pipefail

# Based on class w7a, we use variables to assign them to the arguments in order they come in

input_file_path="$1"
line_number="$2"

# Based on class w7a, we are able to assign arugemts, like for now we are saying print that line in that file. But tail  n=1 to make it only print one line (they wanted line)
head -n "$line_number" "$input_file_path" | tail -n 1
