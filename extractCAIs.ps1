try {
    # Ensure the base manifest directory exists
    $manifestBase = "./manifest"

    if (Test-Path $manifestBase) {
        Remove-Item -Path $manifestBase -Recurse -Force
        Write-Host "manifest folder removed"
    }

    if (!(Test-Path $manifestBase)) {
        New-Item -ItemType Directory -Path $manifestBase | Out-Null
    }

    # Get all images in the media folder
    $images = Get-ChildItem "media\*.jpg", "media\*.jpeg", "media\*.png", "media\*.webp", "media\*.mp4" -ErrorAction SilentlyContinue

    foreach ($image in $images) {
        # Create a unique output folder name based on the image's name
        $outputFolder = Join-Path $manifestBase $image.BaseName

        Write-Host "Processing: $($image.Name)"
        & .\app\c2patool.exe $image.FullName --output $outputFolder -f
        if ($LASTEXITCODE -ne 0) {
            Write-Host "Exit code: $LASTEXITCODE"
        }

        $manifestFile = Join-Path $outputFolder "manifest_store.json"

        if (Test-Path $manifestFile) {
            $newManifestName = "$($image.BaseName)_manifest.json"
            Rename-Item -Path $manifestFile -NewName $newManifestName -Force
        }
    }

    Read-Host "Finished processing all images. Press Enter to exit"
}
catch {
    Write-Error $_
    Read-Host "An error occurred. Press Enter to exit"
}