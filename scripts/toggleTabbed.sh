#!/bin/bash

winId=$(xdotool getactivewindow)
winClass=$(xprop -id "$winId" WM_CLASS | awk -F '"' '{print $(NF-1)}')

getTabbedId() {
    xwininfo -root -tree | grep tabbed | awk '{print $1}' | tail -n1
}

spawnTabbed() {
    tabbed -c -n tabbed &
    sleep 0.3
}

tabAttach() {
    local target="$1"
    local tabbedId=$(getTabbedId)
    [ -z "$tabbedId" ] && spawnTabbed && tabbedId=$(getTabbedId)
    xprop -id "$target" -f _TABBED_SELECT_TAB 32c -set _TABBED_SELECT_TAB 0x$(printf %x "$target")
    xdotool windowreparent "$target" "$tabbedId"
}

tabDetachAll() {
    local tabbedId="$1"
    for child in $(xwininfo -children -id "$tabbedId" | awk '/0x/{print $1}'); do
        xdotool windowreparent "$child" "$(xwininfo -root | awk '/Window id:/ {print $4}')"
    done
}

if [ "$winClass" = "tabbed" ]; then
    tabDetachAll "$winId"
else
    tabAttach "$winId"
fi

