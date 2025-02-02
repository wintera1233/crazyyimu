# version: '3.8' # 指定 Docker Compose 的版本

# services: # 定義服務
#   ros2: # 自定義服務名稱，以下是此服務的配置
#     image: ros2-imu:test # 使用的映像名稱，或是用 image ID
#     container_name: ros2-container
#     # runtime: nvidia  # 使用 GPU
#     environment:
#       - DISPLAY=${DISPLAY}  # 將 host 的 DISPLAY 環境變數傳遞給 container
#       - QT_X11_NO_MITSHM=1  # 告訴 Qt 框架不要使用 MIT-SHM
#     volumes:
#       - /home/yvnc/local_ws/iu_ws:/home/USERNAME/iu_ws  # 掛載 workspace 資料夾
#       - /dev:/dev  # I/O 設備掛載
#       - /tmp/.X11-unix:/tmp/.X11-unix:rw  # 掛載 X11 socket 以支持 GUI
#     working_dir: /home/USERNAME/iu_ws  # 設置工作目錄
#     tty: true  # 分配偽終端，對應 docker run 的 -it 參數
#     stdin_open: true  # 保持 stdin 打開以支持交互式 shell

version: '3.8'
services:
  ros2-imu:
    image: wintera1233/ros2-humble-spatial:v1
    container_name: ros2-container
    environment:
      - DISPLAY=${DISPLAY} 
    device:
      - /dev/bus/usb
    volumes:
      - /dev:/dev
      - /home/yvnc/local_ws/iu_ws/scripts:/home/USERNAME/iu_ws/scripts  # 将本地的 src 目录挂载到容器内
    working_dir: /home/USERNAME/iu_ws
    command: /bin/bash
    stop_grace_period: 1s
    tty: true
    stdin_open: true
    privileged: true
    