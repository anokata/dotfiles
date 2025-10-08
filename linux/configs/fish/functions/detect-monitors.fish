function detect_monitors -d "Exports Xrandr monitor names and count as global variables"
    # 1. Capture the list of monitor names only.
    #    The output is a simple list of monitor names (e.g., eDP-1, DP-2).
    set -l monitor_list (bspc query -M --names)
    set -l i 0

    for monitor_name in $monitor_list
        set i (math $i + 1)
        # Set a global variable: MONITOR_1, MONITOR_2, etc.
        set -gx MONITOR_$i $monitor_name
    end

    # 3. Set the total count as a global variable.
    set -gx MONITOR_COUNT $i
end
