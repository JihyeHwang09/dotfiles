
# UTF-8 사용
LANG="en_US.UTF-8"

# 256 color 사용
export TERM=xterm-256color

alias ll="ls -alh"

# terminal history 설정
export HISTCONTROL=ignoreboth
export HISTSIZE=1000000
export HISTFILESIZE=1000000000
export HISTTIMEFORMAT="%F %T "
shopt -s histappend     # 히스토리 파일 뒤에 추가한다
shopt -s cmdhist        # 여러 줄에 걸쳐 작성된 멍령을 세미콜론으로 연결된 하나의 문장으로 저장

# colors
GREEN='\e[0;32m\]'
B_GREEN='\e[1;32m\]'
MAGENTA='\e[0;35m\]'
B_MAGENTA='\e[1;35m\]'
YELLOW='\e[0;33m\]'
B_YELLOW='\e[1;33m\]'
RED='\e[0;31m'
BLUE='\e[0;34m'
B_BLUE='\e[1;34m'
CYAN='\e[0;36m\]'
COLOR_END='\[\033[0m\]'

# PROMPT ----------------------------------------------------------------------
# PS1="\h:\W \u\$ "  # default promopt
function gbr {
    git status --short 2> /dev/null 1> /dev/null
    if [ "$?" -ne "0" ]; then
        return 1
    else
        branch="`git branch | grep '^\*' | cut -c 3-`"
        branch_str="\033[1;031m$branch\033[0m"

        stat=`git s \
            | awk '{print $1}' \
            | sort | uniq -c \
            | tr '\n' ' ' \
            | sed -E 's/([0-9]+) /\1/g; s/  */ /g; s/ *$//'`

        stash_size=`git stash list | wc -l | sed 's/ //g'`
        stash_icon=" \e[0;92m≡\033[0m"
        printf "[$branch_str]$stat$stash_icon$stash_size"
        return 0
    fi
}

export PS1="${MAGENTA}\$(date +%Y-%m-%d-%a) \
${B_YELLOW}\$(date +%T) \
${GREEN}\u \
${B_MAGENTA}\h \
${B_BLUE}\w \
${COLOR_END}\
\$(gbr)\n\$ "


# PROMPT_COMMAND="share_history; $PROMPT_COMMAND"

[ -f ~/.local/bin/git-completion.bash ] && source ~/.local/bin/git-completion.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

source $(which fav.sh)
bind '"\ev": "\C-ufav\C-m"'
