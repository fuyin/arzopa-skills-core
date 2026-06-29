param(
  [string]$Repo = "https://github.com/fuyin/arzopa-skills-core.git",
  [string]$Ref = "main",
  [string]$Target,
  [switch]$Overwrite
)

$ErrorActionPreference = "Stop"
$packageDir = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot "..")).Path
if (-not $Target) {
  $Target = Split-Path -Parent $packageDir
}

Write-Host "Arzopa Skills Core installer"
Write-Host "Repo: $Repo"
Write-Host "Ref: $Ref"
Write-Host "Target: $Target"

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  throw "git is required to install Arzopa Skills Core"
}

$stamp = Get-Date -Format "yyyyMMddHHmmss"
$workDir = Join-Path ([System.IO.Path]::GetTempPath()) "arzopa-skills-core-$stamp"

New-Item -ItemType Directory -Force -Path $workDir | Out-Null
git -c http.sslBackend=openssl clone --depth 1 --branch $Ref $Repo $workDir
if ($LASTEXITCODE -ne 0) {
  throw "git clone failed with exit code $LASTEXITCODE"
}

$sourceSkills = Join-Path $workDir "skills"
if (-not (Test-Path -LiteralPath $sourceSkills)) {
  throw "skills directory not found in downloaded repository"
}

New-Item -ItemType Directory -Force -Path $Target | Out-Null

$installed = 0
$skipped = 0
Get-ChildItem -LiteralPath $sourceSkills -Directory | ForEach-Object {
  $destination = Join-Path $Target $_.Name
  if ((Test-Path -LiteralPath $destination) -and (-not $Overwrite)) {
    Write-Host "Skip existing skill: $($_.Name)"
    $script:skipped += 1
    return
  }

  Write-Host "Install skill: $($_.Name)"
  Copy-Item -LiteralPath $_.FullName -Destination $destination -Recurse -Force
  $script:installed += 1
}

Write-Host "Installed: $installed"
Write-Host "Skipped: $skipped"
Write-Host "Done"
