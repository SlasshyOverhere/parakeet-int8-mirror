param(
  [string]$Repo = "SlasshyOverhere/parakeet-int8-mirror",
  [string]$Tag = "models-parakeet-int8-v1"
)

$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
  throw "GitHub CLI (gh) is required."
}

gh release upload $Tag `
  "$PSScriptRoot\parakeet-v2-int8.tar.gz" `
  "$PSScriptRoot\parakeet-v3-int8.tar.gz" `
  "$PSScriptRoot\checksums.json" `
  "$PSScriptRoot\manifest-files.json" `
  --repo $Repo --clobber

Write-Host "Uploaded assets to https://github.com/$Repo/releases/tag/$Tag"
