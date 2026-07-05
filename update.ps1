$files = Get-ChildItem -Path . -Recurse -Include *.html, *.js, *.css | Where-Object { $_.Name -ne "yankees.html" }

foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    
    # Fix layout and navigation by making paths root-relative
    $content = $content -replace 'href="\./', 'href="/'
    $content = $content -replace 'src="\./', 'src="/'
    
    # Replace Names
    $content = $content -replace "Yankee's Locksmith", "Iron KEY & CO"
    $content = $content -replace "Yankees Locksmith", "Iron KEY & CO"
    $content = $content -replace "Yankee's", "Iron KEY & CO"
    $content = $content -replace "yankeeslocksmith\.com", "ironkeyandco.com"
    $content = $content -replace "yankeeslocksmith", "ironkeyandco"
    
    # Replace Emails
    $content = $content -replace "ironkeyandco@hotmail\.com", "000000@000000.com"
    $content = $content -replace "yankeeslocksmith@hotmail\.com", "000000@000000.com"
    
    # Replace Phone numbers
    $content = $content -replace "\+1-718-431-8080", "+1-000-000-0000"
    $content = $content -replace "17184318080", "10000000000"
    $content = $content -replace "\(718\) 431-8080", "000000"
    $content = $content -replace "718-431-8080", "000-000-0000"
    
    # Replace Locations
    $content = $content -replace "6400 Bay Pkwy, Brooklyn, NY 11204", "000000"
    $content = $content -replace "6400 Bay Pkwy", "000000"
    $content = $content -replace "Brooklyn, NY 11204", "000000"
    
    Set-Content -Path $f.FullName -Value $content -NoNewline
    Write-Host "Updated $($f.FullName)"
}
