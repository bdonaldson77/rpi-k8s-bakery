[CmdletBinding()]
param (
    [Parameter()]
    [switch]$replace
)

$projectRoot = Split-Path $PWD
$dirs = Get-ChildItem -Path $projectRoot -Directory

foreach ($dir in $dirs) {
    if (Test-Path "$projectRoot/$($dir.Name)/$($dir.Name).yaml") {
        $content = Get-Content "$projectRoot/$($dir.Name)/$($dir.Name).yaml"
        Write-Verbose $content.ToString()

        if ($replace.IsPresent) {
            Write-Output "=> Replacing existing deployment $($dir.Name)"
            & kubectl replace --force -f "$projectRoot/$($dir.Name)/$($dir.Name).yaml" -n=bakery-media
        }
        else {
            Write-Output "=> Refreshing existing deployment $($dir.Name)"
            & kubectl rollout restart deployment "$($dir.Name)" -n=bakery-media
        }
    }
    else {
        Write-Output "No matching deployment manifest found in folder $($dir.Name)"
    }
}