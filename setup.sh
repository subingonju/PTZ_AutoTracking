#!/bin/bash
set -e

# 이 스크립트가 있는 폴더를 기준으로 동작 (어디서 git clone 했는지 상관없음)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "=== package ==="
sudo apt update && sudo apt upgrade -y
sudo apt install -y python3-picamera2 imx500-all python3-opencv python3-numpy

echo "=== picamera2 repo clone ==="
cd ~
if [ ! -d "picamera2" ]; then
    git clone https://github.com/raspberrypi/picamera2
fi

echo "=== file copy ==="
cp "$SCRIPT_DIR/imx500_person_detection.py" ~/picamera2/examples/imx500/

echo "=== config.txt check ==="
if ! grep -q "camera_auto_detect=1" /boot/firmware/config.txt; then
    echo "camera_auto_detect=1" | sudo tee -a /boot/firmware/config.txt
    echo ">>> reboot needed"
fi

echo "good. reboot and play it"
echo "cd ~/picamera2/examples/imx500"
echo "python3 imx500_person_detection.py --model /usr/share/imx500-models/imx500_network_ssd_mobilenetv2_fpnlite_320x320_pp.rpk"
