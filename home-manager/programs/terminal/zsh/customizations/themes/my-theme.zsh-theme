# mycolor.zsh-theme

# primary prompt: dashed separator, directory and vcs info
PS1="${FG[245]}%n ${FG[032]}[%~]\$(git_prompt_info)\$(hg_prompt_info)
${FG[105]}%(!.#.$)%{$reset_color%} "
PS2="%{$fg[red]%}\ %{$reset_color%}"

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX=" ${FG[075]}( ${FG[078]}"
ZSH_THEME_GIT_PROMPT_CLEAN="${fg[green]}✔ "
ZSH_THEME_GIT_PROMPT_DIRTY="${fg[red]}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${FG[075]})%{$reset_color%}"

# hg settings
ZSH_THEME_HG_PROMPT_PREFIX=" ${FG[075]}( ${FG[078]}"
ZSH_THEME_HG_PROMPT_CLEAN="${fg[green]}✔ "
ZSH_THEME_HG_PROMPT_DIRTY="${fg[red]}✗%{$reset_color%}"
ZSH_THEME_HG_PROMPT_SUFFIX="${FG[075]})%{$reset_color%}"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX=" ${FG[075]}["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"
