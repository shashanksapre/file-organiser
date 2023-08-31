import os
import shutil

# Get current working directory
cwd = os.getcwd()

# Create sub directories/folders if not present
if not os.path.exists(os.path.join(cwd, "Images")):
    os.makedirs("Images")
if not os.path.exists(os.path.join(cwd, "Videos")):
    os.makedirs("Videos")
if not os.path.exists(os.path.join(cwd, "Documents")):
    os.makedirs("Documents")
if not os.path.exists(os.path.join(cwd, "Music")):
    os.makedirs("Music")
if not os.path.exists(os.path.join(cwd, "Coding")):
    os.makedirs("Coding")
if not os.path.exists(os.path.join(cwd, "Others")):
    os.makedirs("Others")

# Set extensions
image_extensions = ['.jpg', '.jpeg', '.png']
video_extensions = ['.mp4', '.mpeg', '.mkv']
document_extensions = ['.doc', '.docx', '.ppt', '.pptx',
                       '.xls', '.xlsx', '.txt', '.pdf', '.odt', '.ods', '.odp', '.csv']
music_extensions = ['.mp3', '.wav', '.aac']
coding_extensions = ['.sql', '.yaml', '.yml',
                     '.js', '.ts', '.c', '.html', '.xml', '.json']

# Set untouchable files
os_files = [".DS_Store", ".directory"]
script_files = [".py", ".sh", ".ps1"]

# Iterate through files
for file in os.listdir(cwd):
    # Grab extension of files
    ext = os.path.splitext(file)[1].lower()
    # Skip folders/directories and os specific files
    if os.path.isdir(os.path.join(cwd, file)) or file in os_files or ext in script_files:
        continue
    # Move file into appropriate folder/directory
    if ext in image_extensions:
        shutil.move(os.path.join(cwd, file), os.path.join(cwd, "Images"))
    elif ext in video_extensions:
        shutil.move(os.path.join(cwd, file), os.path.join(cwd, "Videos"))
    elif ext in document_extensions:
        shutil.move(os.path.join(cwd, file), os.path.join(cwd, "Documents"))
    elif ext in music_extensions:
        shutil.move(os.path.join(cwd, file), os.path.join(cwd, "Music"))
    elif ext in coding_extensions:
        shutil.move(os.path.join(cwd, file), os.path.join(cwd, "Coding"))
    else:
        shutil.move(os.path.join(cwd, file), os.path.join(cwd, "Others"))
