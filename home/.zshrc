# Cache brew prefix (avoid repeated subprocess calls)
BREW_PREFIX="${HOMEBREW_PREFIX:-/opt/homebrew}"

# Completions - only rebuild once per day
FPATH=$BREW_PREFIX/share/zsh-completions:$FPATH
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

# Autosuggestions config
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

# Editor
export EDITOR='hx'
export VISUAL='hx'

# PYENV
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if [[ -o interactive ]]; then
    # Lazy load for faster interactive shell startup
    _load_pyenv() {
        unset -f python python3 pip pip3 pyenv
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
    }
    python() { _load_pyenv && python "$@"; }
    python3() { _load_pyenv && python3 "$@"; }
    pip() { _load_pyenv && pip "$@"; }
    pip3() { _load_pyenv && pip3 "$@"; }
    pyenv() { _load_pyenv && pyenv "$@"; }
else
    # Non-interactive: init directly (for scripts, Claude Code, etc.)
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Git aliases
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gcam='git commit -a -m'
alias gcm='git commit -m'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gdca='git diff --cached'
alias gf='git fetch'
alias gl='git pull'
alias glog='git log --oneline --decorate --graph'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gr='git remote'
alias grb='git rebase'
alias grbi='git rebase -i'
alias gss='git status -s'
alias gst='git status'
alias gsw='git switch'
alias gswc='git switch -c'
alias gl5='git log -l 5'

# ESC ESC to prepend sudo (like oh-my-zsh sudo plugin)
sudo-command-line() {
    [[ -z $BUFFER ]] && LBUFFER="$(fc -ln -1)"
    if [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}
zle -N sudo-command-line
bindkey '\e\e' sudo-command-line

# Aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias workhorse="ssh glen@172.16.1.23"
alias ls='eza'
alias l='eza -al'
alias cat='bat'

# NVM - lazy loaded for faster shell startup
export NVM_DIR="$HOME/.nvm"
_load_nvm() {
    unset -f nvm node npm npx pnpm claude codex gemini
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
}
nvm() { _load_nvm && nvm "$@"; }
node() { _load_nvm && node "$@"; }
npm() { _load_nvm && npm "$@"; }
npx() { _load_nvm && npx "$@"; }
pnpm() { _load_nvm && pnpm "$@"; }
claude() { _load_nvm && claude "$@"; }
codex() { _load_nvm && codex "$@"; }
gemini() { _load_nvm && gemini "$@"; }

# PATH exports
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/devl/oracli/bin
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
export PATH=$PATH:~/.local/bin/

# Headspinio
export HEADSPIN_HOME=~/headspinio
export PATH=$PATH:$HEADSPIN_HOME/devtools/bin:$HEADSPIN_HOME/ops/bin:/usr/local/opt/mysql@5.7/bin
export PYTHONPATH=$PYTHONPATH:$HEADSPIN_HOME/devtools:$HEADSPIN_HOME/platform:$HEADSPIN_HOME/common:$HEADSPIN_HOME/mar:$HEADSPIN_HOME/reports:$HEADSPIN_HOME/ops:$HEADSPIN_HOME/pbox:$HEADSPIN_HOME/loadtests:$HEADSPIN_HOME/pushserver:$HEADSPIN_HOME/product-error-codes:$HEADSPIN_HOME/onpremadmin

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Google Cloud SDK
if [ -f '/Users/glen/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/glen/Downloads/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/glen/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/glen/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# Plugins (must be near end, syntax-highlighting must be last plugin)
source $BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Starship prompt
eval "$(starship init zsh)"

# History search - up/down arrows search history based on what you've typed
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^r' history-incremental-search-backward

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

. "$HOME/.local/bin/env"

# Java
export JAVA_HOME="/opt/homebrew/opt/openjdk@21/libexec/openjdk.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

alias cx='codex --yolo "commit"'
