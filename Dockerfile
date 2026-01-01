FROM n8nio/n8n:latest

# 改用 root 執行
USER root

# 可選：安裝你要用的系統工具
 RUN apt-get update && apt-get install -y ffmpeg vim && rm -rf /var/lib/apt/lists/*

# 建立可寫資料夾
RUN mkdir -p /data && chmod -R 777 /data

# 保留官方 entrypoint，讓 n8n 用原本方式啟動
ENTRYPOINT ["tini", "--", "n8n"]
