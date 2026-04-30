# Neovim Config

Personal Neovim configuration built on [lazy.nvim](https://github.com/folke/lazy.nvim).

## Quick Install (new machine)

**Prerequisites:** `git`, `nvim >= 0.10`, `node`, `ripgrep`

```bash
# macOS (Homebrew)
brew install neovim git node ripgrep

# Then run the installer
bash <(curl -fsSL https://raw.githubusercontent.com/smilezouyunhao/Config/master/install.sh)
```

Or clone manually:

```bash
git clone git@github.com:smilezouyunhao/Config.git ~/.config/nvim
~/.config/nvim/install.sh
```

## Post-install

| Step | Command |
|------|---------|
| Authenticate Copilot | `:Copilot auth` inside Neovim |
| Install Claude Code CLI | `npm install -g @anthropic-ai/claude-code` |
| LSP servers | Auto-installed by Mason on first file open |

## Plugin highlights

- **Package manager:** lazy.nvim
- **LSP:** nvim-lspconfig + Mason (pyright by default)
- **Completion:** nvim-cmp
- **Fuzzy find:** Telescope + ripgrep
- **AI:** Copilot, Claude Code
- **UI:** noice, bufferline, neo-tree, dashboard
