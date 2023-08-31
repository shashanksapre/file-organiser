import os
import shutil

# Directories to create
directories = ["Images", "Videos", "Documents", "Music", "Coding", "Others"]

# Extensions
extensions = {
    "Images": ['.jpg', '.jpeg', '.png'],
    "Videos": ['.mp4', '.mpeg', '.mkv'],
    "Documents": ['.doc', '.docx', '.ppt', '.pptx', '.xls', '.xlsx', '.txt', '.pdf', '.odt', '.ods', '.odp', '.csv'],
    "Music": ['.mp3', '.wav', '.aac'],
    "Coding": ['.sql', '.yaml', '.yml', '.js', '.ts', '.c', '.html', '.xml', '.json']
}

# Untouchable files
os_files = {".DS_Store", ".directory"}
script_files = {".py", ".sh", ".ps1"}

# Create directories if they don't exist
for dir_name in directories:
    if not os.path.exists(dir_name):
        os.makedirs(dir_name)

# Organize files
for file in os.listdir():
    if os.path.isfile(file):
        ext = os.path.splitext(file)[1].lower()
        if (os.path.basename(file) in os_files) or (ext in script_files):
            continue
        moved = False
        for dir_name, ext_list in extensions.items():
            if ext in ext_list:
                shutil.move(file, os.path.join(dir_name, file))
                moved = True
                break
        if not moved:
            shutil.move(file, os.path.join("Others", file))
