# prompt0
# %F => color dict
# %f => reset color
# %~ => current path
# %* => time
# %n => username
# %m => shortname host
# %(?..) => prompt conditional - %(condition.true.false)

prompt_git_status() {
  local INDEX STATUS

  INDEX=$(command git status --porcelain -b 2> /dev/null)

  STATUS=""

  if $(echo "$INDEX" | command grep -E '^\?\? ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  fi

  if $(echo "$INDEX" | grep '^A  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  elif $(echo "$INDEX" | grep '^MM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  fi

  if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^MM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  fi

  if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_RENAMED$STATUS"
  fi

  if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^D  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  fi

  if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STASHED$STATUS"
  fi

  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  fi

  if $(echo "$INDEX" | grep '^## [^ ]\+ .*ahead' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_AHEAD$STATUS"
  fi

  if $(echo "$INDEX" | grep '^## [^ ]\+ .*behind' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_BEHIND$STATUS"
  fi

  if $(echo "$INDEX" | grep '^## [^ ]\+ .*diverged' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DIVERGED$STATUS"
  fi

  if [[ ! -z "$STATUS" ]]; then
    echo " [ $STATUS]"
  fi
}


prompt_git_branch() {
    autoload -Uz vcs_info 
    precmd_vcs_info() { vcs_info }
    precmd_functions+=( precmd_vcs_info )
    setopt prompt_subst
    zstyle ':vcs_info:git:*' formats '%b'
}

prompt_git_info() {
    [ ! -z "$vcs_info_msg_0_" ] && echo "$ZSH_THEME_GIT_PROMPT_PREFIX%B%F{white}$vcs_info_msg_0_%f%b$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# prompt_precmd() {
#     local TERMWIDTH=$(( COLUMNS - ${ZLE_RPROMPT_INDENT:-1} ))
#     local promptsize=${#${(%):--(%~)}}
#
#     PR_FILLBAR="${(l:$(( TERMWIDTH - promptsize )):: :)}"
# }

prompt_setup() {
    # Display git branch
    
    # autoload -Uz add-zsh-hook
    # add-zsh-hook precmd prompt_precmd

    setopt prompt_subst
    
    ZSH_THEME_GIT_PROMPT_PREFIX=" %B%F{red}⛕ %f%b"
    ZSH_THEME_GIT_PROMPT_DIRTY=""
    ZSH_THEME_GIT_PROMPT_CLEAN=""

    ZSH_THEME_GIT_PROMPT_ADDED="%F{green}●%f "
    ZSH_THEME_GIT_PROMPT_MODIFIED="%F{blue}◎%f "
    ZSH_THEME_GIT_PROMPT_DELETED="%F{red}⃠⛒%f "
    ZSH_THEME_GIT_PROMPT_RENAMED="%F{magenta}R%f "
    ZSH_THEME_GIT_PROMPT_UNMERGED="%F{yellow}⟚%f "
    ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{white}◍%f "
    ZSH_THEME_GIT_PROMPT_STASHED="%B%F{red}◌%f%b "
    ZSH_THEME_GIT_PROMPT_BEHIND="%B%F{red}↲%f%b "
    ZSH_THEME_GIT_PROMPT_AHEAD="%B%F{green}↱%f%b "

#     PR_HBAR="─"
#     PR_ULC="┌"
#     PR_LLC="└"

#     PROMPT='%F{grey}${PR_ULC}${PR_HBAR}%f(%F{cyan}%~%f)${(e)PR_FILLBAR}%F{grey}${PR_LLC}${PR_HBAR}%B$(prompt_git_info) %F{blue}❯%f%b'
#     RPROMPT='$(prompt_git_status)'
    
    prompt_git_branch
    RPROMPT='$(prompt_git_info) $(prompt_git_status)'
    PROMPT='%F{134}%n %F{111}%d $B%F{blue}❯%f%b '
}

prompt_setup
