{ while true; do
    nvidia-smi --query-gpu=power.draw --format=csv,noheader | sed -E "s/([0-9]+).*/\1/g"
    sleep 0.2
done; } | ttyplot -c "$(echo -ne " \u$(printf '%x' 9617) ")" -m 330 -C '173' -M 5 -u W -s 10000
