# 使用 n8n 最新版
FROM n8nio/n8n:latest

# 切換 root
USER root

# 診斷指令：印出作業系統發行版本資訊
RUN cat /etc/os-release
