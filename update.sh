#!/bin/sh

set -e

dotfiles=$(dirname $0)

files="bashrc gitconfig ssh/authorized_keys vimrc git-prompt.sh i3/config i3status.conf profile signature utils/backlight-common.sh utils/backlight-down.sh utils/backlight-up.sh utils/screen-rotate-daemon.py"

git -C "$dotfiles" pull

for f in $files
do
    target=~/."$f"
    if [ -e "$target" ]
    then
        cmp "$dotfiles/$f" "$target" || vimdiff "$dotfiles/$f" "$target"
    else
        cp "$dotfiles/$f" "$target"
    fi
    echo ".$f"
done
