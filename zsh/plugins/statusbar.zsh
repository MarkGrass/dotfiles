zmodload zsh/terminfo
autoload -Uz add-zsh-hook
statusbar () {
  echoti sc
  echoti home

  print -nP -- "[$( git branch --show-current 2> /dev/null )]($VIRTUAL_ENV)%n@%M:%~"

  echoti el
  echoti rc
}
add-zsh-hook precmd statusbar
