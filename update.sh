#!/bin/sh

set -e

dotfiles=$(dirname $0)

files="bashrc gitconfig ssh/authorized_keys vimrc git-prompt.sh i3/config i3status.conf profile signature"

git -C "$dotfiles" pull

for f in $files
do
    target=~/."$f"
    cmp "$dotfiles/$f" "$target" || vimdiff "$dotfiles/$f" "$target"
    echo ".$f"
done
