#!/bin/bash

# Directories to create
directories=("Images" "Videos" "Documents" "Music" "Coding" "Others")

# Extensions
declare -A extensions=(
  ["Images"]="jpg jpeg png"
  ["Videos"]="mp4 mpeg mkv"
  ["Documents"]="doc docx ppt pptx xls xlsx tx pdf odt ods odp csv"
  ["Music"]="mp3 wav aac"
  ["Coding"]="sql yaml yml js ts c html xml json md"
)

# Untouchable files
os_files=(".DS_Store" ".directory")
script_extensions=("py sh ps1")

# Create directories if they don't exist
for dir in "${directories[@]}"; do
  mkdir -p "$dir"
done

# Organize files
for file in *; do
  if [ -f "$file" ]; then
    lower="${file,,}"  # Convert to lowercase
    ext="${lower##*.}"
    if ! [[ " ${os_files[*]} " =~ " ${lower} " ]] && ! [[ " ${script_extensions[*]} " =~ " ${ext} " ]]; then
      moved=false
      for dir in "${!extensions[@]}"; do
        if [[ " ${extensions[$dir]} " =~ " ${ext} " ]]; then
          mv "$file" "$dir"
          moved=true
          break
        fi
      done
      if [ "$moved" = false ]; then
        mv "$file" "Others"
      fi
    fi
  fi
done