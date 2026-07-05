$baseUrl = "https://www.yankeeslocksmith.com"
$files = @(
    "/index.html",
    "/about.html",
    "/assets/styles.css",
    "/assets/site.js",
    "/assets/brooklyn-locksmith-hero.webp",
    "/assets/nyc-auto-locksmith.webp",
    "/assets/residential-locksmith-card.webp",
    "/assets/commercial-locksmith-card.webp",
    "/services/auto-locksmith.html",
    "/services/residential-locksmith.html",
    "/services/commercial-locksmith.html",
    "/services/emergency-locksmith.html",
    "/services/smart-locks.html",
    "/services/safe-locksmith.html",
    "/services/installation-repair.html",
    "/services/deadbolt-locks.html",
    "/locations/brooklyn-locksmith.html",
    "/locations/manhattan-locksmith.html",
    "/locations/queens-locksmith.html",
    "/locations/bronx-locksmith.html",
    "/locations/staten-island-locksmith.html"
)

foreach ($file in $files) {
    $url = "$baseUrl$file"
    # Remove leading slash for local path
    $localPath = $file.Substring(1)
    
    # Create directory if it doesn't exist
    $dir = Split-Path $localPath -Parent
    if ($dir -and -not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
    
    Write-Host "Downloading $url to $localPath"
    curl.exe -s -L -o $localPath $url
}
Write-Host "Download complete!"
