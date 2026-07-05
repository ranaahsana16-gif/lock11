$files = Get-ChildItem -Path . -Recurse -Include *.html | Where-Object { $_.Name -ne "yankees.html" }

foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    
    # 1. Replace the 3 links with "Services"
    $pattern = '<a href="/services/auto-locksmith\.html">Automotive</a>\s*<a href="/services/residential-locksmith\.html">Residential</a>\s*<a href="/services/commercial-locksmith\.html">Business</a>'
    $content = [regex]::Replace($content, $pattern, '<a href="/services.html">Services</a>')
    
    # 2. Determine relative prefix
    $relPrefix = "./"
    if ($f.DirectoryName -match "\\services$|\\locations$") {
        $relPrefix = "../"
    }

    # 3. Replace all root-relative paths with accurate relative paths
    $content = $content -replace 'href="/', "href=`"$relPrefix"
    $content = $content -replace 'src="/', "src=`"$relPrefix"
    
    Set-Content -Path $f.FullName -Value $content -NoNewline
    Write-Host "Updated $($f.FullName) with prefix $relPrefix"
}
