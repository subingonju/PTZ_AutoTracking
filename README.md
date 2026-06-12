# AI Camera 사람 검출 (Raspberry Pi AI Camera / IMX500)

## 필요 하드웨어
- Raspberry Pi 4 또는 5
- Raspberry Pi AI Camera (IMX500)
- Raspberry Pi OS 최신 버전 설치됨

## 설치 방법

1. 이 폴더(또는 레포)를 라즈베리파이로 가져옵니다.
   ```bash
   git clone <레포 주소>
   cd <레포명>
   ```

2. 실행 권한 부여 후 설치 스크립트 실행
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

3. 설치가 끝나면 재부팅
   ```bash
   sudo reboot
   ```

## 실행 방법

재부팅 후:
```bash
cd ~/picamera2/examples/imx500
python3 imx500_person_detection.py --model /usr/share/imx500-models/imx500_network_ssd_mobilenetv2_fpnlite_320x320_pp.rpk
```

화면에 **사람만** 초록색 박스로 표시됩니다.

## 종료
프리뷰 창에서 `Ctrl + C`

## 문제 해결
- `rpicam-hello --list-cameras` 명령으로 카메라 인식 여부 확인
- 모델 로딩에 1~2분 정도 걸릴 수 있습니다 (정상)
