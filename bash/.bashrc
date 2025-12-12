export BASH_ENV="$HOME/.config/bash/.bashrc"

export PATH="$PATH:$HOME/.cargo/bin:"

fastfetch

eval "$(starship init bash)"

alias ls='eza -a -1 --icons --group-directories-first'
alias cdot='cd ~/Desktop/arch_dotfiles'
alias update='sudo pacman -Syu'
alias install='sudo pacman -S'
alias remove='sudo pacman -Rns'
alias cleanup='sudo pacman -Rns $(pacman -Qdtq)'
alias c='clear'
alias h='history'
alias grep='grep --color=auto'
alias please='sudo $(history -p !!)'
alias mkdir='mkdir -pv'
alias cp='cp -i'  
alias mv='mv -i'
alias rm='rm -i'
alias aur='sudo paru -S'
alias files="zellij -l strider"
alias code="zellij"
alias hx="helix"
alias gc="git commit -m"
alias gps="git push"
alias gpl="git pull"
alias ga="git add *"
alias gi="git init"
alias dev="cd ~/Desktop/progaming"

function _bnui_hook() {
    local command="$1"
    local env_cmds
    env_cmds="$(bnui tick --command "$command" 2>&1 >/dev/tty)"
    eval "$env_cmds"
}

# Append to existing PROMPT_COMMAND
if [[ -n "$PROMPT_COMMAND" ]]; then
    PROMPT_COMMAND="${PROMPT_COMMAND}; _bnui_hook \"\$(history 1 | sed 's/^[ ]*[0-9]*[ ]*//')\""
else
    PROMPT_COMMAND='_bnui_hook "$(history 1 | sed "s/^[ ]*[0-9]*[ ]*//")"'
fi
