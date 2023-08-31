$directories = @("Images", "Videos", "Documents", "Music", "Coding", "Others")

# Extensions
$extensions = @{
    "Images" = @('.jpg', '.jpeg', '.png')
    "Videos" = @('.mp4', '.mpeg', '.mkv')
    "Documents" = @('.doc', '.docx', '.ppt', '.pptx', '.xls', '.xlsx', '.txt', '.pdf', '.odt', '.ods', '.odp', '.csv')
    "Music" = @('.mp3', '.wav', '.aac')
    "Coding" = @('.sql', '.yaml', '.yml', '.js', '.ts', '.c', '.html', '.xml', '.json')
}

# Untouchable files
$os_files = @(".DS_Store", ".directory")
$script_files = @(".py", ".sh", ".ps1")

# Create directories if they don't exist
$directories | ForEach-Object {
    if (-not (Test-Path $_)) {
        New-Item -ItemType Directory -Force -Path $_
    }
}

# Organize files
$files = Get-ChildItem "."
foreach ($file in $files) {
    if ($file.PSIsContainer -or $file.Name -in $os_files -or $file.Extension -in $script_files) {
        continue
    }
    $ext = $file.Extension.ToLower()
    $moved = $false
    foreach ($dir in $extensions.GetEnumerator()) {
        if ($ext -in $dir.Value) {
            Move-Item -Path $file.FullName -Destination $dir.Key
            $moved = $true
            break
        }
    }
    if (-not $moved) {
        Move-Item -Path $file.FullName -Destination "Others"
    }
}
