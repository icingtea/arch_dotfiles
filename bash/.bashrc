# ~/.bashrc — stowed from ~/Desktop/arch_dotfiles/bash

path_prepend() {
    case ":$PATH:" in
        *":$1:"*) ;;
        *) PATH="$1:$PATH" ;;
    esac
}

path_append() {
    case ":$PATH:" in
        *":$1:"*) ;;
        *) PATH="$PATH:$1" ;;
    esac
}

# The whole desktop session gets PATH from ~/.config/environment.d/10-path.conf.
# Repeated here for TTY logins and ssh, where environment.d doesn't apply.
path_prepend "$HOME/.local/bin"
path_prepend "$HOME/scripts"
path_append "$HOME/.cargo/bin"
path_append "$HOME/go/bin"
export PATH

export EDITOR=hx
export VISUAL=hx

# Everything below is for interactive shells only; scripts stop here.
[[ $- != *i* ]] && return

fastfetch
eval "$(starship init bash)"

alias ls='eza -a -1 --icons --group-directories-first'
alias cdot='cd ~/Desktop/arch_dotfiles'
alias dev='cd ~/Desktop/progaming'

# packages (paru calls sudo itself and also updates AUR packages)
alias update='paru -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias aur='paru -S'
alias cleanup='pkg-clean'

alias c='clear'
alias h='history'
alias grep='grep --color=auto'
alias please='sudo $(history -p !!)'
alias mkdir='mkdir -pv'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias hx='helix'
alias zj='zellij'
alias files='zellij -l strider'

alias gc='git commit -m'
alias gps='git push'
alias gpl='git pull'
alias ga='git add -A'
alias gi='git init'

# bnui
# function _bnui_hook() {
#   bnui tick
#   source /tmp/bnui_env.sh
# }
#
# if [[ -n "$PROMPT_COMMAND" ]]; then
#   PROMPT_COMMAND="${PROMPT_COMMAND}; _bnui_hook"
# else
#   PROMPT_COMMAND="_bnui_hook"
# fi
