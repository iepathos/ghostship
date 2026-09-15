# ghostship

Personal terminal setup for the Ghostty + tmux + Starship stack.

## Tracked Configs

- `config/ghostty/config` -> `~/Library/Application Support/com.mitchellh.ghostty/config`
- `config/helix/config.toml` -> `~/.config/helix/config.toml`
- `config/helix/languages.toml` -> `~/.config/helix/languages.toml`
- `config/yabai/yabairc` -> `~/.yabairc`
- `config/skhd/skhdrc` -> `~/.skhdrc`
- `config/tmux/tmux.conf` -> `~/.config/tmux/tmux.conf`
- `config/starship/starship.toml` -> `~/.config/starship.toml`
- `home/.zshrc` -> `~/.zshrc`
- `home/.zprofile` -> `~/.zprofile`
- `home/.zshenv` -> `~/.zshenv`

## Install

On a fresh Mac, install the Xcode Command Line Tools (`xcode-select --install`)
and [Homebrew](https://brew.sh/) first. Run the following from this repo's root:

```sh
brew bundle
./scripts/install.sh
```

The Brewfile includes the `asmvik/formulae` tap required for yabai and skhd.
The installer backs up existing files under `~/.ghostship-backups/<timestamp>/`
before creating symlinks. It does not start services or grant macOS permissions.

Helix settings and language-server configuration are included. The configured
language servers (`rust-analyzer`, `pylsp`, `gopls`, and
`typescript-language-server`) must be installed separately.

tmux persistence uses TPM and `tmux-resurrect`. Install the plugins with:

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect
```

yabai and skhd need additional setup on each Mac after installing the configs.
Start their launch agents as your normal user:

```sh
yabai --start-service
skhd --start-service
```

In **System Settings > Privacy & Security > Accessibility**, enable both yabai
and skhd when prompted. If either is missing, use the + button to add the binary;
`command -v yabai` and `command -v skhd` show their paths. Then restart both
services so they pick up the permissions:

```sh
yabai --restart-service
skhd --restart-service
```

Use those restart commands after config changes as well. If skhd still ignores
hotkeys, check that Secure Keyboard Entry is disabled in your terminal app.
For startup errors, inspect `/tmp/yabai_<username>.err.log` and
`/tmp/skhd_<username>.err.log`.

See the upstream [yabai installation guide](https://github.com/asmvik/yabai/wiki/Installing-yabai-%28latest-release%29)
and [skhd setup instructions](https://github.com/asmvik/skhd#install).

## Notes

- Ghostty launches tmux with `tmux new-session -A -s main`, so terminal state
  persists across Ghostty restarts.
- tmux can manually save and restore sessions with `prefix + Ctrl-s` and
  `prefix + Ctrl-r`.
- tmux owns the bottom tab UI. Ghostty owns window rendering, font metrics, and
  key routing into tmux.
- User-specific paths resolve from `$HOME`. This setup still assumes macOS
  with Homebrew installed at `/opt/homebrew`.
