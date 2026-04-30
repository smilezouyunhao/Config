#!/bin/bash
set -e

REPO="git@github.com:smilezouyunhao/Config.git"
NVIM_CONFIG="$HOME/.config/nvim"

echo "==> Checking dependencies..."

check_cmd() {
  if ! command -v "$1" &>/dev/null; then
    echo "  [MISSING] $1 — $2"
    MISSING=1
  else
    echo "  [OK] $1"
  fi
}

MISSING=0
check_cmd nvim   "Install via: brew install neovim  /  apt install neovim"
check_cmd git    "Install via: brew install git     /  apt install git"
check_cmd node   "Install via: brew install node    /  nvm install --lts  (required by Copilot)"
check_cmd rg     "Install via: brew install ripgrep /  apt install ripgrep  (required by Telescope)"

if [ "$MISSING" -eq 1 ]; then
  echo ""
  echo "Please install the missing dependencies above, then re-run this script."
  exit 1
fi

echo ""
echo "==> Cloning config into $NVIM_CONFIG ..."

if [ -d "$NVIM_CONFIG" ]; then
  echo "  Directory already exists. Pulling latest changes instead..."
  git -C "$NVIM_CONFIG" pull --ff-only
else
  git clone "$REPO" "$NVIM_CONFIG"
fi

echo ""
echo "==> Launching Neovim to install plugins (this may take a minute)..."
echo "    lazy.nvim will auto-install all plugins. You can quit with :q after it finishes."
echo ""
nvim --headless "+Lazy! sync" +qa 2>&1 | grep -v "^$" || true

echo ""
echo "Done! Run 'nvim' to start."
echo ""
echo "Post-install reminders:"
echo "  - Copilot: run ':Copilot auth' inside Neovim to authenticate"
echo "  - LSP servers are managed by Mason and install automatically on first open"
echo "  - Claude Code: install with 'npm install -g @anthropic-ai/claude-code'"
