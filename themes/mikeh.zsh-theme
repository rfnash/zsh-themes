# vim:ft=zsh
# Based off of the oh-my-zsh mikah theme

setopt prompt_subst
autoload colors
colors

autoload -U add-zsh-hook
autoload -Uz vcs_info

ZSH_THEME_GIT_PROMPT_ADDED="%1FA"
ZSH_THEME_GIT_PROMPT_MODIFIED="%1FM"
ZSH_THEME_GIT_PROMPT_DELETED="%1FD"
ZSH_THEME_GIT_PROMPT_RENAMED="%1F>"                                          
ZSH_THEME_GIT_PROMPT_UNMERGED="%1F#"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%1F?"
ZSH_THEME_GIT_PROMPT_PREFIX="%B%4F[git:%2F"
ZSH_THEME_GIT_PROMPT_SUFFIX="%B%4F] "
ZSH_THEME_GIT_PROMPT_DIRTY="%1F(%{$(git_prompt_status)%})"

# check-for-changes can be really slow.
# you should disable it, if you work with large repositories
zstyle ':vcs_info:*:prompt:*' check-for-changes true
zstyle ':vcs_info:*' disable cdv p4 tla git
zstyle ':vcs_info:*' actionformats '%B%4F[%s:%2F%b|%1F%a%f] '
zstyle ':vcs_info:*' formats       '%B%4F[%s:%2F%b%f] '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%1F:%3F%r'

add-zsh-hook precmd vcs_info

theme_precmd() {
    vcs_info
}

return_status=$'%B%(?,,%1F[%?]%b%f )'
user_machine=$'%B%4F[%2F%n%0F@%b%6F%m%B%4F]%b%f'
date=$'%B%4F[%b%3F'%D{"%a %b %d, %I:%M"}$'%B%4F]%b%f'
curdur=$'%B%4F[%7F%~%4F]'

PROMPT=$'$return_status$user_machine - $date - $curdur%b%f 
$vcs_info_msg_0_$(git_prompt_info)%# %b%f'
PS2=$' %B%4F>%b%f '
