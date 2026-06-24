$jsonFolder = "./json"
$manifestFolder = "./manifest"

# Create json folder if it doesn't exist
if (!(Test-Path $jsonFolder)) {
    New-Item -ItemType Directory -Path $jsonFolder | Out-Null
}

# Find all JSON files under manifest recursively
Get-ChildItem -Path $manifestFolder -Filter "*.json" -File -Recurse | ForEach-Object {
    Move-Item -Path $_.FullName -Destination $jsonFolder -Force
}

Write-Host "All JSON files moved to $jsonFolder"

Read-Host "Press Enter to exit"