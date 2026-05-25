# zsh reads this for every shell, including scripts — keep it minimal.

BREW_PREFIX="${HOMEBREW_PREFIX:-/opt/homebrew}"
export NVM_DIR="$HOME/.nvm"

_load_nvm() {
    unset -f nvm node npm npx pnpm claude codex gemini
    [[ -s "$BREW_PREFIX/opt/nvm/nvm.sh" ]] && source "$BREW_PREFIX/opt/nvm/nvm.sh"
    if [[ -o interactive && -s "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ]]; then
        source "$BREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
    fi
}
nvm() { _load_nvm && command nvm "$@"; }
node() { _load_nvm && command node "$@"; }
npm() { _load_nvm && command npm "$@"; }
npx() { _load_nvm && command npx "$@"; }
pnpm() { _load_nvm && command pnpm "$@"; }
claude() { _load_nvm && command claude "$@"; }
codex() { _load_nvm && command codex "$@"; }
gemini() { _load_nvm && command gemini "$@"; }
