#!/usr/bin/env bash
# Waybar custom/vpn: ETH VPN state. Prints nothing (module hidden) on machines
# without the drs-vpn `vpn` command, i.e. everywhere except zappa.
vpn="$HOME/.local/bin/vpn"
[[ -x $vpn ]] || exit 0
if "$vpn" status >/dev/null 2>&1; then
    printf '{"text":"\\uf023 VPN","class":"connected","tooltip":"ETH VPN connected\\nClick to disconnect"}\n'
else
    printf '{"text":"\\uf09c VPN","class":"disconnected","tooltip":"ETH VPN disconnected\\nClick to connect"}\n'
fi
