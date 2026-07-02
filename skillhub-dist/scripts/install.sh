#!/usr/bin/env bash
set -euo pipefail

REPO="${ARZOPA_SKILLS_CORE_REPO:-https://github.com/fuyin/arzopa-skills-core.git}"
REF="${ARZOPA_SKILLS_CORE_REF:-main}"
CODEX_HOME_DIR="${CODEX_HOME:-$HOME/.codex}"
OVERWRITE="false"

while [ "$#" -gt 0 ]; do
  case "$1" in
    --repo)
      REPO="$2"
      shift 2
      ;;
    --ref)
      REF="$2"
      shift 2
      ;;
    --codex-home)
      CODEX_HOME_DIR="$2"
      shift 2
      ;;
    --overwrite)
      OVERWRITE="true"
      shift
      ;;
    *)
      echo "Unknown argument: $1" >&2
      exit 1
      ;;
  esac
done

CODEX_HOME_DIR="$(cd "$(dirname "$CODEX_HOME_DIR")" && pwd)/$(basename "$CODEX_HOME_DIR")"
TARGET_SKILLS="$CODEX_HOME_DIR/skills"
TARGET_AGENTS="$CODEX_HOME_DIR/AGENTS.md"

echo "Arzopa Skills Core installer"
echo "Repo: $REPO"
echo "Ref: $REF"
echo "Codex home: $CODEX_HOME_DIR"
echo "Skills target: $TARGET_SKILLS"
echo "AGENTS target: $TARGET_AGENTS"

if ! command -v git >/dev/null 2>&1; then
  echo "git is required to install Arzopa Skills Core" >&2
  exit 1
fi

WORK_DIR="${TMPDIR:-/tmp}/arzopa-skills-core-$(date +%Y%m%d%H%M%S)"
# Download the full repository because the SkillHub package is only a small installer.
mkdir -p "$WORK_DIR"
git -c http.sslBackend=openssl clone --depth 1 --branch "$REF" "$REPO" "$WORK_DIR"

SOURCE_SKILLS="$WORK_DIR/skills"
if [ ! -d "$SOURCE_SKILLS" ]; then
  echo "skills directory not found in downloaded repository" >&2
  exit 1
fi

SOURCE_AGENTS="$WORK_DIR/AGENTS.md"
if [ ! -f "$SOURCE_AGENTS" ]; then
  echo "AGENTS.md not found in downloaded repository" >&2
  exit 1
fi

mkdir -p "$TARGET_SKILLS"
installed=0
skipped=0

for skill_dir in "$SOURCE_SKILLS"/*; do
  [ -d "$skill_dir" ] || continue
  name="$(basename "$skill_dir")"
  destination="$TARGET_SKILLS/$name"
  if [ -e "$destination" ] && [ "$OVERWRITE" != "true" ]; then
    echo "Skip existing skill: $name"
    skipped=$((skipped + 1))
    continue
  fi

  echo "Install skill: $name"
  if [ -d "$destination" ]; then
    cp -R "$skill_dir"/. "$destination"
  else
    cp -R "$skill_dir" "$destination"
  fi
  installed=$((installed + 1))
done

mkdir -p "$CODEX_HOME_DIR"
if [ -f "$TARGET_AGENTS" ]; then
  BACKUP_AGENTS="$TARGET_AGENTS.bak-$(date +%Y%m%d%H%M%S)"
  echo "Backup existing AGENTS.md: $BACKUP_AGENTS"
  cp "$TARGET_AGENTS" "$BACKUP_AGENTS"
fi

echo "Install AGENTS.md"
cp "$SOURCE_AGENTS" "$TARGET_AGENTS"

echo "Installed: $installed"
echo "Skipped: $skipped"
echo "AGENTS.md: installed"
echo "Done"
