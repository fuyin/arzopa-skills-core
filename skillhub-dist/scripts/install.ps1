param(
  [string]$Repo = "https://github.com/fuyin/arzopa-skills-core.git",
  [string]$Ref = "main",
  [string]$CodexHome,
  [switch]$Overwrite
)

$ErrorActionPreference = "Stop"
if (-not $CodexHome) {
  if ($env:CODEX_HOME) {
    $CodexHome = $env:CODEX_HOME
  } else {
    $CodexHome = Join-Path $HOME ".codex"
  }
}

$CodexHome = [System.IO.Path]::GetFullPath($CodexHome)
$targetSkills = Join-Path $CodexHome "skills"
$targetAgents = Join-Path $CodexHome "AGENTS.md"

Write-Host "Arzopa Skills Core installer"
Write-Host "Repo: $Repo"
Write-Host "Ref: $Ref"
Write-Host "Codex home: $CodexHome"
Write-Host "Skills target: $targetSkills"
Write-Host "AGENTS target: $targetAgents"

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  throw "git is required to install Arzopa Skills Core"
}

$stamp = Get-Date -Format "yyyyMMddHHmmss"
$workDir = Join-Path ([System.IO.Path]::GetTempPath()) "arzopa-skills-core-$stamp"

# Download the full repository because the SkillHub package is only a small installer.
New-Item -ItemType Directory -Force -Path $workDir | Out-Null
git -c http.sslBackend=openssl clone --depth 1 --branch $Ref $Repo $workDir
if ($LASTEXITCODE -ne 0) {
  throw "git clone failed with exit code $LASTEXITCODE"
}

$sourceSkills = Join-Path $workDir "skills"
if (-not (Test-Path -LiteralPath $sourceSkills)) {
  throw "skills directory not found in downloaded repository"
}

$sourceAgents = Join-Path $workDir "AGENTS.md"
if (-not (Test-Path -LiteralPath $sourceAgents)) {
  throw "AGENTS.md not found in downloaded repository"
}

New-Item -ItemType Directory -Force -Path $targetSkills | Out-Null

$installed = 0
$skipped = 0
Get-ChildItem -LiteralPath $sourceSkills -Directory | ForEach-Object {
  $destination = Join-Path $targetSkills $_.Name
  if ((Test-Path -LiteralPath $destination) -and (-not $Overwrite)) {
    Write-Host "Skip existing skill: $($_.Name)"
    $script:skipped += 1
    return
  }

  Write-Host "Install skill: $($_.Name)"
  if (Test-Path -LiteralPath $destination) {
    Get-ChildItem -LiteralPath $_.FullName -Force | ForEach-Object {
      Copy-Item -LiteralPath $_.FullName -Destination $destination -Recurse -Force
    }
  } else {
    Copy-Item -LiteralPath $_.FullName -Destination $destination -Recurse -Force
  }
  $script:installed += 1
}

New-Item -ItemType Directory -Force -Path $CodexHome | Out-Null
if (Test-Path -LiteralPath $targetAgents) {
  $backupAgents = "$targetAgents.bak-$stamp"
  Write-Host "Backup existing AGENTS.md: $backupAgents"
  Copy-Item -LiteralPath $targetAgents -Destination $backupAgents -Force
}

Write-Host "Install AGENTS.md"
Copy-Item -LiteralPath $sourceAgents -Destination $targetAgents -Force

Write-Host "Installed: $installed"
Write-Host "Skipped: $skipped"
Write-Host "AGENTS.md: installed"
Write-Host "Done"
