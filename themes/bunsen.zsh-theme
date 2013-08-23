# vim: ft=zsh
# from http://www.drbunsen.org/text-triumvirate.html
# modified by Robert F. Nash

### VCS info
autoload -U add-zsh-hook
autoload -Uz vcs_info

# check-for-changes can be really slow.
# you should disable it, if you work with large repositories
zstyle ':vcs_info:*:prompt:*' check-for-changes true
zstyle ':vcs_info:*' disable cdv p4 tla git
zstyle ':vcs_info:*' actionformats " on %{$fg[magenta]%}%b|%a%{$fg_bold[green]%}(%s)%{$reset_color%}"
zstyle ':vcs_info:*' formats       " on %{$fg[magenta]%}%b%{$fg_bold[green]%}(%s)%{$reset_color%}"
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%1F:%3F%r'

add-zsh-hook precmd vcs_info

theme_precmd() {
    vcs_info
}

function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}

function my_vcs {
    if [[ -n "$vcs_info_msg_0_" ]]; then
        echo -n "$vcs_info_msg_0_"
    else
        echo -n "$(git_prompt_info)"
    fi
}

PROMPT='%{$fg[magenta]%}%n%{$reset_color%}@%{$fg[yellow]%}$(box_name)%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(my_vcs)$(virtualenv_info)
%(?,,%{${fg_bold[blue]}%}[%?]%{$reset_color%} )$ '

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}[!]"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}[?]"
ZSH_THEME_GIT_PROMPT_CLEAN=""

RPROMPT='%{$fg[white]%}[%*]%{$reset_color%}'
