#!/bin/sh

dotfiles=$(dirname $0)

files="bashrc gitconfig ssh/authorized_keys vimrc git-prompt.sh i3/config i3status.conf profile signature utils/backlight-common.sh utils/backlight-down.sh utils/backlight-up.sh utils/screen-rotate-daemon.py ssh/config"

old=$(md5sum "$0")
git -C "$dotfiles" pull
new=$(md5sum "$0")

if [ "$old" != "$new" ]
then
    echo "$0 has been updated, please run it again" >&2
    exit
fi

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
