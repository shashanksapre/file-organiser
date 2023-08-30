$CWD=Get-Location

Write-Host $CWD

New-Item -ItemType Directory -Force -Path "Images"
New-Item -ItemType Directory -Force -Path "Videos"
New-Item -ItemType Directory -Force -Path "Documents"
New-Item -ItemType Directory -Force -Path "Music"
New-Item -ItemType Directory -Force -Path "Coding"
New-Item -ItemType Directory -Force -Path "Others"

$image_extensions = @('.jpg', '.jpeg', '.png')
$video_extensions = @('.mp4', '.mpeg', '.mkv')
$document_extensions = @('.doc', '.docx', '.ppt', '.pptx', '.xls', '.xlsx', '.txt', '.pdf', '.odt', '.ods', '.odp', '.csv')
$music_extensions = @('.mp3', '.wav', '.aac')
$coding_extensions = @('.sql', '.yaml', '.yml', '.js', '.ts', '.c', '.html', '.xml', '.json')

# Set untouchable files
$os_files=(".DS_Store", ".directory")
$script_files=(".py", ".sh", ".ps1")

$files = Get-ChildItem "."
foreach ($file in $files) {
    Write-Host $file
    if ($file.PSIsContainer -or $file -in $os_files -or  $file.Extension -in $script_files) {
        continue
    }
    if ($file.Extension -in $image_extensions) {
        Move-Item -Path "$file" -Destination "Images"
    } elseif ($file.Extension -in $video_extensions) {
        Move-Item -Path "$file" -Destination "Videos"
    } elseif ($file.Extension -in $document_extensions) {
        Move-Item -Path "$file" -Destination "Documents"
    } elseif ($file.Extension -in $music_extensions) {
        Move-Item -Path "$file" -Destination "Music"
    } elseif ($file.Extension -in $coding_extensions) {
        Move-Item -Path "$file" -Destination "Coding"
    } else {
        Move-Item -Path "$file" -Destination "Others"
    }
}