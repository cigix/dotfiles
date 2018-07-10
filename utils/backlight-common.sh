backlight_dir=""

for match in "/sys/class/backlight/"*
do
    backlight_dir="$match"
    break # only get one match
done

# no backlight device found
[ "$backlight_dir" = '/sys/class/backlight/*' ] && exit 1

max_brightness=$(cat "$backlight_dir"/max_brightness)
cur_brightness=$(cat "$backlight_dir"/brightness)
indent=$((max_brightness / 20))

function set_brightness ()
{
    echo $1 | sudo tee "$backlight_dir"/brightness
}
