#!/usr/bin/env bash
CHOSEN_NETWORK=$(nmcli -t -f SSID device wifi list | grep -v '^--' | uniq | rofi -dmenu -i -p "󰖩 WiFi" -theme ~/.config/rofi/config.rasi)
if [ -z "$CHOSEN_NETWORK" ]; then
    exit 1
fi
IS_CONNECTED=$(nmcli -t -f NAME connection show --active | grep -x "$CHOSEN_NETWORK")
if [ -n "$IS_CONNECTED" ]; then
    RESPONSE=$(echo -e "Disconnect\nCancel" | rofi -dmenu -i -p "󰖪 Already connected to $CHOSEN_NETWORK" -theme ~/.config/rofi/config.rasi)
    if [ "$RESPONSE" == "Disconnect" ]; then
        nmcli connection down "$CHOSEN_NETWORK" && notify-send "WiFi" "Disconnected from $CHOSEN_NETWORK"
    fi
else
    HAS_PROFILE=$(nmcli -t -f NAME connection show | grep -x "$CHOSEN_NETWORK")
    if [ -n "$HAS_PROFILE" ]; then
        nmcli connection up "$CHOSEN_NETWORK" --ask || nmcli device wifi connect "$CHOSEN_NETWORK"
        notify-send "WiFi" "Connected to $CHOSEN_NETWORK"
    else
        PASSWORD=$(rofi -dmenu -password -p " Password for $CHOSEN_NETWORK" -theme ~/.config/rofi/config.rasi)
        if [ -n "$PASSWORD" ]; then
            nmcli device wifi connect "$CHOSEN_NETWORK" password "$PASSWORD" && notify-send "WiFi" "Connected to $CHOSEN_NETWORK"
        fi
    fi
fi
