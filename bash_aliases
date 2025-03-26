export PATH=${PATH}:~/bin
export PATH=${PATH}:~/.cargo/bin
export EDITOR='vi'

alias ls='ls -GF'
alias ll='ls -lGFh'
alias less='less -eX'
alias hh='history 20'

# Application aliases
alias tig='tig --word-diff'
alias lg='lazygit'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias open='xdg-open'
alias xv='xviewer'
alias eq='emacs -q'
alias emacs='emacs -q'
alias e='/usr/bin/emacs'
alias ec='emacsclient -c -n'
# alias nb='nota'
# alias n='PYTHONPATH=~/src/nota python -m nota'
# alias nt='PYTHONPATH=~/src/nota python -m nota --database ~/Dropbox/nota-test.db'
alias dirs='dirs -v'
alias td='python ~/bin/t.py --task-dir ~/Dropbox --list todo'
alias t='python ~/bin/t.py --task-dir . --list tasks'
alias readme='displayreadme'
alias netmon='lsof -P -i -n | cut -f 1 -d " " | uniq'
alias boce='g oce; git pl; cd ..; make oce'
alias r='radian'
alias jupyter-notebook='~/.local/bin/jupyter-notebook --no-browser'

# Show git branch and status at bash prompt
function parse_git_dirty {
    [[ $(git status 2>/dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}
function parse_git_branch {
    git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

MKL_NUM_THREADS=1
export MKL_NUM_THREADS

# # Add task count (for tasks in current directory)
# function count_tasks {
#     ~/bin/t.py | wc -l | sed -e 's/ *//' 2> /dev/null | sed -e 's/^0$//' | sed -e 's/^/(/' | sed -e 's/$/t)/' | sed -e 's/(t)//'
# }
# function count_todo {
#     cat ~/Dropbox/todo | wc -l | sed -e 's/ *//' 2> /dev/null | sed -e 's/^0$//' | sed -e 's/^/|/' | sed -e 's/$/td|/' | sed -e 's/|td|//'
# }

# function to detect if a README* file is present in current directory
function detect_readme {
    test=$(ls | grep README | wc -l)
    if [ $test -gt 0 ]; then
        echo "[RM]"
    fi
}

function last_two_dirs {
    pwd | rev | awk -F / '{print $1,$2}' | rev | sed s_\ _/_
}

## export PS1='\h:\[\033[1;33m\]\W\[\033[0m\]'
export PS1='\h:\[\033[1;34m\]$(last_two_dirs)/\[\033[0m\]'
export PS1="$PS1\$(parse_git_branch)"
# export PS1="$PS1\$(count_tasks)"
# export PS1="\[\033[0;31m\]\$(count_todo)\[\033[0m\]$PS1"
export PS1="\[\033[0;32m\]\$(detect_readme)\[\033[0m\]$PS1"
export PS1="$PS1$ "

#Bashmarks
source ~/bin/bashmarks.sh
