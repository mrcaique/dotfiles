# ~/.bashrc

shopt -s autocd cdspell checkwinsize cmdhist dirspell histappend
set -o noclobber

EDITOR="vim"
HISTFILE="$HOME/.history"
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTTIMEFORMAT='%F %T '
PROMPT_COMMAND='history -a'
CC="gcc"

[ -f "$HOME/.aliases" ] && . "$HOME/.aliases"

backup() {
    for file in "$@" ; do
        cp "$file" "${file}-$(date +%Y-%m-%d-%H%M%S)".backup
    done
}

calc() {
    bc -l <<< "$@"
}

downiso() {
    link="$(\grep -m1 -o "http.*" /etc/pacman.d/mirrorlist | cut -d\$ -f1)"
    path="$link/iso/latest/"
    file="$(curl -s "$path" | \grep -m1 "\.iso" | cut -d\" -f2)"
    curl -s "$path$file" > "$file" &
}

ll() {
    ls "$@" -lh
}

lla() {
    ls "$@" -lah
}

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

mgit() {
    for d in */ ; do
        if [ -d "$d/.git" ] ; then
            output=$(git -C "$d" "$1")
            grep -q nothing <<< "$(sed '3q;d' <<< "$output")"
            if [[ "$1" = "status" && ! $? -eq 0 ]] || \
               [[ "$1" = "diff" && "$output" ]] ; then
                echo -e "\033[1m$d\033[0m"
                echo "$output"
            fi
        fi
    done
}

pacsize() {
    expac -HM "%011m\t%-25n\t%10d" $(comm -23 <(pacman -Qqen | sort) \
        <(pacman -Qqg base base-devel | sort)) | sort -nr | less
}

up() {
    local d=""
    limit=$1
    for ((i = 1; i <= limit; i++)); do
        d=$d/..
    done
    d=$(echo $d | sed 's/^\///')
    if [ -z "$d" ]; then
        d=..
    fi
    cd $d || exit
}

PS1='\[\e[01;37m\][\A]\[\e[0m\]\[\e[00;37m\] '              # [HH:MM]
PS1+='\[\e[0m\]\[\e[01;34m\]\u\[\e[0m\]\[\e[01;37m\]@\h '   # user@host
PS1+='\[\e[0m\]\[\e[01;34m\]\w\[\e[0m\]\[\e[00;37m\] '      # absolute path
PS1+='\[\e[0m\]\[\e[01;37m\]\\$\[\e[0m\] '                  # $

if pkgfile 2>/dev/null ; then
    . /usr/share/doc/pkgfile/command-not-found.bash
fi

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && startx

[[ -f "$HOME/.Xresources" ]] && xrdb -merge "$HOME/.Xresources"
