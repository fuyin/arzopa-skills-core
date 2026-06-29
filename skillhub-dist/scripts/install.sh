#!/usr/bin/env bash
set -euo pipefail

REPO="${ARZOPA_SKILLS_CORE_REPO:-https://github.com/fuyin/arzopa-skills-core.git}"
REF="${ARZOPA_SKILLS_CORE_REF:-main}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET="$(cd "$PACKAGE_DIR/.." && pwd)"
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
    --target)
      TARGET="$2"
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

echo "Arzopa Skills Core installer"
echo "Repo: $REPO"
echo "Ref: $REF"
echo "Target: $TARGET"

if ! command -v git >/dev/null 2>&1; then
  echo "git is required to install Arzopa Skills Core" >&2
  exit 1
fi

WORK_DIR="${TMPDIR:-/tmp}/arzopa-skills-core-$(date +%Y%m%d%H%M%S)"
mkdir -p "$WORK_DIR"
git -c http.sslBackend=openssl clone --depth 1 --branch "$REF" "$REPO" "$WORK_DIR"

SOURCE_SKILLS="$WORK_DIR/skills"
if [ ! -d "$SOURCE_SKILLS" ]; then
  echo "skills directory not found in downloaded repository" >&2
  exit 1
fi

mkdir -p "$TARGET"
installed=0
skipped=0

for skill_dir in "$SOURCE_SKILLS"/*; do
  [ -d "$skill_dir" ] || continue
  name="$(basename "$skill_dir")"
  destination="$TARGET/$name"
  if [ -e "$destination" ] && [ "$OVERWRITE" != "true" ]; then
    echo "Skip existing skill: $name"
    skipped=$((skipped + 1))
    continue
  fi

  echo "Install skill: $name"
  cp -R "$skill_dir" "$destination"
  installed=$((installed + 1))
done

echo "Installed: $installed"
echo "Skipped: $skipped"
echo "Done"
