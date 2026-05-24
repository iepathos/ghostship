# ghostship

Personal terminal setup for the Ghostty + tmux + Starship stack.

## Tracked Configs

- `config/ghostty/config` -> `~/Library/Application Support/com.mitchellh.ghostty/config`
- `config/yabai/yabairc` -> `~/.yabairc`
- `config/skhd/skhdrc` -> `~/.skhdrc`
- `config/tmux/tmux.conf` -> `~/.config/tmux/tmux.conf`
- `config/starship/starship.toml` -> `~/.config/starship.toml`
- `home/.zshrc` -> `~/.zshrc`
- `home/.zprofile` -> `~/.zprofile`
- `home/.zshenv` -> `~/.zshenv`

## Install

```sh
brew bundle
./scripts/install.sh
```

The installer backs up existing files under `~/.ghostship-backups/<timestamp>/`
before creating symlinks.

tmux persistence uses TPM and `tmux-resurrect`. Install the plugins with:

```sh
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect
```

yabai and skhd are managed as launch agents:

```sh
yabai --start-service
skhd --start-service
```

Restart them after config changes with:

```sh
yabai --restart-service
skhd --restart-service
```

## Notes

- Ghostty launches tmux with `tmux new-session -A -s main`, so terminal state
  persists across Ghostty restarts.
- tmux can manually save and restore sessions with `prefix + Ctrl-s` and
  `prefix + Ctrl-r`.
- tmux owns the bottom tab UI. Ghostty owns window rendering, font metrics, and
  key routing into tmux.
- Shell files are personal and may contain machine-specific paths.
