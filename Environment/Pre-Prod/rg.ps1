# CSV file
$CsvFile = ".\resource-groups.csv"

# Output Terraform file
$OutputFile = ".\terraform.tfvars"

# CSV read karo
$ResourceGroups = Import-Csv $CsvFile

# Output start
$output = @"
rgs = {
"@

foreach ($rg in $ResourceGroups) {

    $output += @"

    $($rg.key) = {
        name     = "$($rg.name)"
        location = "$($rg.location)"
    }
"@
}

# Output end
$output += @"
}
"@

# File mein save karo
$output | Set-Content -Path $OutputFile -Encoding UTF8

Write-Host ""
Write-Host "====================================" -ForegroundColor Green
Write-Host "Terraform file successfully created!" -ForegroundColor Green
Write-Host "====================================" -ForegroundColor Green
Write-Host ""
Write-Host "Output: $OutputFile" -ForegroundColor Cyan
Write-Host ""