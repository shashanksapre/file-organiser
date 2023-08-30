#!/bin/bash

# Get working directory/folder
PWD=`pwd`

# Create sub directories/folders if not present
if ! [[ -d "$PWD/Images" ]] ; then
  mkdir "Images"
fi

if ! [[ -d "$PWD/Videos" ]] ; then
  mkdir "Videos"
fi

if ! [[ -d "$PWD/Documents" ]] ; then
  mkdir "Documents"
fi

if ! [[ -d "$PWD/Music" ]] ; then
  mkdir "Music"
fi

if ! [[ -d "$PWD/Coding" ]] ; then
  mkdir "Coding"
fi

if ! [[ -d "$PWD/Others" ]] ; then
  mkdir "Others"
fi

# Set extensions
image_extensions=("jpg" "jpeg" "png")
video_extensions=("mp4" "mpeg" "mkv")
document_extensions=("doc" "docx" "ppt" "pptx" "xls" "xlsx" "tx" "pdf" "odt" "ods" "odp" "csv")
music_extensions=("mp3" "wav" "aac")
coding_extensions=("sql" "yaml" "yml" "js" "ts" "c" "html" "xml" "json" "md")

# Set untouchable files
os_files=(".DS_Store" ".directory")
script_files=("py" "sh")

# Iterate through files
for file in *; do 
  # Skip folders/directories and os specific files
  if [ -f "$file" ] && ! [[ " ${os_files[*]} " =~ " ${file} " ]] && ! [[ " ${script_files[*]} " =~ " ${file##*.} " ]]; then
    # Grab extension of files
    ext=${file##*.}
    # Move file into appropriate folder/directory
    if [[ " ${image_extensions[*]} " =~ " ${ext} " ]]; then
      mv "$file" "Images"
    elif [[ " ${video_extensions[*]} " =~ " ${ext} " ]]; then
      mv "$file" "Videos"
    elif [[ " ${document_extensions[*]} " =~ " ${ext} " ]]; then
      mv "$file" "Documents"
    elif [[ " ${music_extensions[*]} " =~ " ${ext} " ]]; then
      mv "$file" "Music"
    elif [[ " ${coding_extensions[*]} " =~ " ${ext} " ]]; then
      mv "$file" "Coding"
    else
      mv "$file" "Others"
    fi
  fi
done