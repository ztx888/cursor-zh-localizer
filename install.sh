#!/usr/bin/env bash
set -euo pipefail

REPO="ztx888/cursor-zh-localizer"
BRANCH="${CURSOR_ZH_BRANCH:-main}"
SCRIPT_URL="https://raw.githubusercontent.com/${REPO}/${BRANCH}/patch-cursor-zh.js"

if ! command -v node >/dev/null 2>&1; then
  echo "Node.js is required. Please install Node.js 18+ first."
  exit 1
fi

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Downloading Cursor 中文增强补丁..."
curl -fsSL "$SCRIPT_URL" -o "$TMP_DIR/patch-cursor-zh.js"
node "$TMP_DIR/patch-cursor-zh.js" "$@"
