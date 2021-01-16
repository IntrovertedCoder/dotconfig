# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.

# Bat file loc
batFile="/org/freedesktop/UPower/devices/battery_BAT1"

# Interface for wifi
interface="wlp2s0"

# Produces "21 days", for example
uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date "+%F %H:%M")

# Returns the battery status: "Full", "Discharging", or "Charging".
battery_status=$(upower -i $batFile | grep percentage | awk '{print $2}')
# if upower -i $(upower -e | grep 'BAT') | grep state | grep discharging > /dev/null; then
    # bat_state='D'
# else
    # bat_state='C'
# fi

# ttk/ttc
if upower -i $batFile | grep 'time to full' > /dev/null; then
    batTTC=$(upower -i $batFile | grep 'time to full' | awk '{print $4 substr($5,0,1)}')
    batLeft="TTC: ${batTTC}"
elif upower -i $batFile | grep 'time to empty' > /dev/null; then
    batTTE=$(upower -i $batFile | grep 'time to empty' | awk '{print $4 substr($5,0,1)}')
    batLeft="TTE: ${batTTE}"
fi

# CPU Temp
cpuTemp=$(sensors | grep 'Tdie' | awk '{print substr($2,2,6)}')
cpu_usage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')

# GPU Temp
gpuTemp=$(sensors | grep 'edge' | awk '{print substr($2,2,6)}')

# Brightness
brightness=$(cat /sys/class/backlight/amdgpu_bl0/brightness)

# Volume
volume=$(amixer sget Master |awk -F"[][]" '/Left:/ { print $2 }')

# Wifi network
wifi=$(iw dev $interface info | grep ssid | awk '{print $2}')
# Compare string to home network (unicode chars suck)
if [ "$wifi" = "\xc2\xaf\x5c(\xe3\x83\x84)/\xc2\xaf" ]; then
    wifi='Home'
fi

echo "Uptime: $uptime_formatted | Brightness: $brightness | Volume: $volume | Wifi: $wifi | Battery: $battery_status $batLeft | CPU: $cpu_usage $cpuTemp | GPU: $gpuTemp | Date: $date_formatted"

