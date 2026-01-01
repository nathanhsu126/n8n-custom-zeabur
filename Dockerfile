# 1. 使用 n8n 官方最新版 (目前基於 Debian)
FROM n8nio/n8n:latest

# 2. 切換成 root 權限
USER root

# 3. 使用 apt-get 安裝 ffmpeg 與中文字型
# update: 更新軟體源
# install -y: 自動回答 yes
# clean & rm: 清除安裝快取，縮小映像檔體積
RUN apt-get update && \
    apt-get install -y ffmpeg fonts-noto-cjk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 4. 切換回 n8n 使用者
USER node
