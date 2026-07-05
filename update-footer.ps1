$files = Get-ChildItem -Path . -Recurse -Include *.html | Where-Object { $_.Name -ne "yankees.html" }

foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    
    $content = $content -replace "All rights reserved\.", "All rights reserved. Powered by <a href=`"https://tillnex.space`" target=`"_blank`" rel=`"noopener`" style=`"color: inherit; text-decoration: underline;`">tillnex.space</a>."
    
    Set-Content -Path $f.FullName -Value $content -NoNewline
    Write-Host "Updated footer in $($f.FullName)"
}
