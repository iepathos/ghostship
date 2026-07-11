## Core environment

BREW_PREFIX="${HOMEBREW_PREFIX:-/opt/homebrew}"

export EDITOR='hx'
export VISUAL='hx'

export PYENV_ROOT="$HOME/.pyenv"
export BUN_INSTALL="$HOME/.bun"

export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PATH:$BREW_PREFIX/bin"
export PATH="$PATH:$HOME/go/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/.foundry/bin"
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$BUN_INSTALL/bin:$PATH"

[[ -r "$HOME/.local/bin/env" ]] && source "$HOME/.local/bin/env"

## Completions

FPATH="$BREW_PREFIX/share/zsh-completions:$FPATH"
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi

## Tool managers

if [[ -o interactive ]]; then
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
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

## Aliases

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias cat='bat'
alias l='eza -al'
alias ls='eza'

alias cx='codex --model gpt-5.4-mini -c model_reasoning_effort="low" --yolo "commit"'
alias yabai-reload='yabai --restart-service; launchctl kickstart -k gui/$(id -u)/com.koekeishiya.skhd'

## Git aliases

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gcam='git commit -a -m'
alias gcb='git checkout -b'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gdca='git diff --cached'
alias gf='git fetch'
alias gl='git pull'
alias gl5='git log -l 5'
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

## Keybindings

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

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^r' history-incremental-search-backward

## Prompt and shell plugins

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1

[[ -r "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && source "$BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
[[ -r "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && source "$BREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

eval "$(starship init zsh)"

## History

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

## Local overrides

local_config="$HOME/.config/ghostship/local.zsh"
[[ -r "$local_config" ]] && source "$local_config"
unset local_config
