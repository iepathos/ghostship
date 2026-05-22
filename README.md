# ghostship

Personal terminal setup for the Ghostty + tmux + Starship stack.

## Tracked Configs

- `config/ghostty/config` -> `~/Library/Application Support/com.mitchellh.ghostty/config`
- `config/tmux/tmux.conf` -> `~/.config/tmux/tmux.conf`
- `config/starship/starship.toml` -> `~/.config/starship.toml`
- `home/.zshrc` -> `~/.zshrc`
- `home/.zprofile` -> `~/.zprofile`
- `home/.zshenv` -> `~/.zshenv`

## Install

```sh
./scripts/install.sh
```

The installer backs up existing files under `~/.ghostship-backups/<timestamp>/`
before creating symlinks.

## Notes

- Ghostty launches tmux with `tmux new-session -A -s main`, so terminal state
  persists across Ghostty restarts.
- tmux owns the bottom tab UI. Ghostty owns window rendering, font metrics, and
  key routing into tmux.
- Shell files are personal and may contain machine-specific paths.
