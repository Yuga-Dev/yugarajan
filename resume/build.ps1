# Renders resume/resume.html to assets/Yuga-Rajan-S-Resume.pdf using headless Edge (or Chrome).
# Usage (from the Portfolio folder): powershell -ExecutionPolicy Bypass -File resume/build.ps1

$root = Split-Path -Parent $PSScriptRoot
$src  = Join-Path $PSScriptRoot 'resume.html'
$out  = Join-Path $root 'assets\Yuga-Rajan-S-Resume.pdf'

$browser = @(
  "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe",
  "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe",
  "$env:ProgramFiles\Google\Chrome\Application\chrome.exe"
) | Where-Object { Test-Path $_ } | Select-Object -First 1

if (-not $browser) { throw 'Edge or Chrome is required to build the PDF.' }

$url = 'file:///' + ($src -replace '\\', '/')
$profileDir = Join-Path $env:TEMP 'resume-pdf-profile'

& $browser --headless=new --disable-gpu --no-pdf-header-footer --user-data-dir="$profileDir" `
  --virtual-time-budget=5000 --print-to-pdf="$out" $url | Out-Null

if (Test-Path $out) {
  "Built $out ($([math]::Round((Get-Item $out).Length / 1KB)) KB)"
} else {
  throw 'PDF was not created.'
}
