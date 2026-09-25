#!/usr/bin/env bash
# Waybar custom/gpu: NVIDIA utilisation + VRAM via nvidia-smi (JSON output).
q=$(nvidia-smi --query-gpu=utilization.gpu,memory.used,memory.total,temperature.gpu,name \
    --format=csv,noheader,nounits 2>/dev/null | head -1) || q=""
if [[ -z $q ]]; then
    printf '{"text":"GPU n/a","tooltip":"nvidia-smi unavailable"}\n'
    exit 0
fi
IFS=', ' read -r util used total temp name <<<"$q"
printf '{"text":"GPU %s%%","tooltip":"%s\\nVRAM %.1f / %.1f GiB\\nTemp %s°C","percentage":%s}\n' \
    "$util" "$name" "$(awk "BEGIN{print $used/1024}")" "$(awk "BEGIN{print $total/1024}")" "$temp" "$util"
