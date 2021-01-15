# The Sway configuration file in ~/.config/sway/config calls this script.
# You should see changes to the status bar after saving this script.
# If not, do "killall swaybar" and $mod+Shift+c to reload the configuration.


# Produces "21 days", for example
uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)

# The abbreviated weekday (e.g., "Sat"), followed by the ISO-formatted date
# like 2018-10-06 and the time (e.g., 14:01)
date_formatted=$(date "+%F %H:%M")

# Returns the battery status: "Full", "Discharging", or "Charging".
battery_status=$(upower -i $(upower -e | grep 'BAT') | grep percentage | awk '{print $2}')
if upower -i $(upower -e | grep 'BAT') | grep state | grep discharging > /dev/null; then
    bat_state='D'
else
    bat_state='C'
fi

# ttk/ttc
if upower -i $(upower -e | grep "BAT") | grep 'time to full' > /dev/null; then
    batTTC=$(upower -i $(upower -e | grep "BAT") | grep 'time to full' | awk '{print $4 substr($5,0,1)}')
    batLeft="TTC: ${batTTC}"
elif upower -i $(upower -e | grep "BAT") | grep 'time to empty' > /dev/null; then
    batTTE=$(upower -i $(upower -e | grep "BAT") | grep 'time to empty' | awk '{print $4 substr($5,0,1)}')
    batLeft="TTE: ${batTTE}"
fi

# CPU Temp
cpuTemp=$(sensors | grep 'Tdie' | awk '{print substr($2,2,6)}')
cpu_usage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')

# GPU Temp
gpuTemp=$(sensors | grep 'edge' | awk '{print substr($2,2,6)}')

# Brightness
brightness=$(cat /sys/class/backlight/amdgpu_bl0/brightness)

echo "Uptime: $uptime_formatted | Battery: $battery_status$bat_state | $batLeft | CPU: $cpu_usage $cpuTemp | GPU: $gpuTemp | Date: $date_formatted"
# Volume
volume=$(amixer sget Master |awk -F"[][]" '/Left:/ { print $2 }')

