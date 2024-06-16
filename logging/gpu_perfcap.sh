#!/bin/bash

echo "Sync,SW_Thermal,HW-Power,HW_Slowdown,SW_Power,APP_Settings,Idle"
echo $(nvidia-smi --query-gpu=clocks_throttle_reasons.sync_boost,clocks_throttle_reasons.sw_thermal_slowdown,\
clocks_throttle_reasons.hw_power_brake_slowdown,clocks_throttle_reasons.hw_slowdown,clocks_throttle_reasons.sw_power_cap,\
clocks_throttle_reasons.applications_clocks_setting,clocks_throttle_reasons.gpu_idle, --format=csv,noheader)
