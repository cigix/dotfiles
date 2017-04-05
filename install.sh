#!/bin/sh

set -e

dotfiles=$(dirname $0)

append="bashrc gitconfig ssh/authorized_keys vimrc"
copy="git-prompt.sh i3/config i3status.conf signature"

for f in $copy
do
    target=~/."$f"
    if test -e "$target"
    then
        echo "~/.$f already exists, skipping..." >&2
    else
        mkdir -p ~/."$(dirname "$f")"
        cp -r "$dotfiles/$f" "$target"
        echo ".$f"
    fi
done

for f in $append
do
    target=~/."$f"
    if test -e "$target"
    then
        echo "~/.$f already exists, appending..." >&2
        echo >> "$target"
        cat "$dotfiles/$f" >> "$target"
    else
        mkdir -p ~/."$(dirname "$f")"
        cp -r "$dotfiles/$f" "$target"
        echo ".$f"
    fi
done
