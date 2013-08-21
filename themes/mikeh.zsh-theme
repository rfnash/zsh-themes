# vim:ft=zsh
# Based off of the oh-my-zsh mikah theme

setopt prompt_subst
autoload colors
colors

autoload -U add-zsh-hook
autoload -Uz vcs_info

# check-for-changes can be really slow.
# you should disable it, if you work with large repositories
zstyle ':vcs_info:*:prompt:*' check-for-changes true
zstyle ':vcs_info:*' enable bzr cvs darcs fossil hg mtn svk svn git
zstyle ':vcs_info:*' disable cdv p4 tla
zstyle ':vcs_info:*' actionformats '%B%4F[%s:%2F%b|%1F%a%f] '
zstyle ':vcs_info:*' formats       '%B%4F[%s:%2F%b%f] '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%1F:%3F%r'

add-zsh-hook precmd vcs_info

return_status=$'%B%(?,,%1F[%?]%b%f )'
user_machine=$'%B%4F[%2F%n%0F@%b%6F%m%B%4F]%b%f'
date=$'%B%4F[%b%3F'%D{"%a %b %d, %I:%M"}$'%B%4F]%b%f'
curdur=$'%B%4F[%7F%~%4F]'

PROMPT=$'$return_status$user_machine - $date - $curdur%b%f 
$vcs_info_msg_0_%# %b%f'
PS2=$' %B%4F>%b%f '
