#!/usr/bin/env bash
set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
backup_root="${HOME}/.ghostship-backups/$(date +%Y%m%d%H%M%S)"

link_file() {
	local source="$1"
	local target="$2"

	mkdir -p "$(dirname "$target")"

	if [[ -L "$target" && "$(readlink "$target")" == "$source" ]]; then
		printf 'ok: %s already linked\n' "$target"
		return
	fi

	if [[ -e "$target" || -L "$target" ]]; then
		mkdir -p "$backup_root$(dirname "$target")"
		mv "$target" "$backup_root$target"
		printf 'backup: %s -> %s\n' "$target" "$backup_root$target"
	fi

	ln -s "$source" "$target"
	printf 'link: %s -> %s\n' "$target" "$source"
}

link_file "$repo_root/config/ghostty/config" "$HOME/Library/Application Support/com.mitchellh.ghostty/config"
link_file "$repo_root/config/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
link_file "$repo_root/config/starship/starship.toml" "$HOME/.config/starship.toml"
link_file "$repo_root/home/.zshrc" "$HOME/.zshrc"
link_file "$repo_root/home/.zprofile" "$HOME/.zprofile"
link_file "$repo_root/home/.zshenv" "$HOME/.zshenv"
