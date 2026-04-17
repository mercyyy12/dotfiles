#######################################################
#               Main ZSH Config                       #
#######################################################
export XDG_CURRENT_DESKTOP=sway
export GTK_THEME="adw-gtk3-dark"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"
zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit ice wait'0' lucid atload'source ~/.config/zsh/zsh-syntax-highlighting-tokyonight.zsh'; zinit light zsh-users/zsh-syntax-highlighting
zinit ice wait'0' lucid; zinit light zsh-users/zsh-completions
zinit ice wait'0' lucid; zinit light zsh-users/zsh-autosuggestions
zinit ice wait'0' lucid; zinit light Aloxaf/fzf-tab
zinit ice wait'0' lucid; zinit light jeffreytse/zsh-vi-mode

zinit ice wait'0' lucid; zinit snippet OMZP::git
zinit ice wait'0' lucid; zinit snippet OMZP::sudo
zinit ice wait'0' lucid; zinit snippet OMZP::docker
zinit ice wait'0' lucid; zinit snippet OMZP::command-not-found

ZVM_INSERT_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BEAM
ZVM_NORMAL_MODE_CURSOR=$ZVM_CURSOR_BLINKING_BLOCK
ZVM_OPPEND_MODE_CURSOR=$ZVM_CURSOR_BLINKING_UNDERLINE

autoload -Uz compinit && compinit
zinit cdreplay -q

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#######################################################
# ZSH Basic Options
#######################################################
setopt autocd
setopt correct
setopt interactivecomments
setopt magicequalsubst
setopt nonomatch
setopt notify
setopt numericglobsort
setopt promptsubst

#######################################################
# Environment Variables
#######################################################
export EDITOR=nvim
export VISUAL=nvim
export SUDO_EDITOR=nvim
export FCEDIT=nvim
export TERMINAL=kitty
export BROWSER=com.brave.Browser

if [[ -x "$(command -v bat)" ]]; then
	export MANPAGER="sh -c 'col -bx | bat -l man -p'"
	export PAGER=bat
fi

if [[ -x "$(command -v fzf)" ]]; then
	export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
	  --info=inline-right \
	  --ansi \
	  --layout=reverse \
	  --border=rounded \
	  --color=border:#27a1b9 \
	  --color=fg:#c0caf5 \
	  --color=gutter:#16161e \
	  --color=header:#ff9e64 \
	  --color=hl+:#2ac3de \
	  --color=hl:#2ac3de \
	  --color=info:#545c7e \
	  --color=marker:#ff007c \
	  --color=pointer:#ff007c \
	  --color=prompt:#2ac3de \
	  --color=query:#c0caf5:regular \
	  --color=scrollbar:#27a1b9 \
	  --color=separator:#ff9e64 \
	  --color=spinner:#ff007c"
fi

#######################################################
# Keybindings & History
#######################################################
bindkey -v
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#######################################################
# Completion styling
#######################################################
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

#######################################################
# Path & Functions
#######################################################
function pathappend() {
    for ARG in "$@"
    do
        if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
            PATH="${PATH:+"$PATH:"}$ARG"
        fi
    done
}

function pathprepend() {
    for ARG in "$@"
    do
        if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
            PATH="$ARG${PATH:+":$PATH"}"
        fi
    done
}

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

pathprepend "$HOME/bin" "$HOME/sbin" "$HOME/.local/bin" "$HOME/local/bin" "$HOME/.bin"
pathappend "$HOME/.cargo/bin"

function runfree() {
	"$@" > /dev/null 2>&1 & disown
}

function cpp() {
	if [[ -x "$(command -v rsync)" ]]; then
		rsync -ah --info=progress2 "${1}" "${2}"
	else
		set -e
		strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
		| awk '{
		count += $NF
		if (count % 10 == 0) {
			percent = count / total_size * 100
			printf "%3d%% [", percent
			for (i=0;i<=percent;i++) printf "="
			printf ">"
			for (i=percent;i<100;i++) printf " "
			printf "]\r"
		} } END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
	fi
}

function cpg() {
	if [[ -d "$2" ]];then cp "$1" "$2" && cd "$2"; else cp "$1" "$2"; fi
}

function mvg() {
	if [[ -d "$2" ]];then mv "$1" "$2" && cd "$2"; else mv "$1" "$2"; fi
}

function mkdirg() {
	mkdir -p "$@" && cd "$@"
}

function random_bars() {
	columns=$(tput cols)
	chars=(▁ ▂ ▃ ▄ ▅ ▆ ▇ █)
	for ((i = 1; i <= $columns; i++)); do
		echo -n "${chars[RANDOM%${#chars} + 1]}"
	done
	echo
}

#######################################################
# Integrations (Deferred for Speed)
#######################################################
zinit ice wait'0' lucid atinit'source <(fzf --zsh)'; zinit light Aloxaf/fzf-tab
zinit ice wait'0' lucid atinit'eval "$(zoxide init --cmd cd zsh)"'; zinit light zdharma-continuum/null



# Terminal Greeting
# fastfetch (Manually run if needed to avoid P10k instant prompt warnings)
