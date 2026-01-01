# 1. 使用 n8n 官方最新版作為基底
FROM n8nio/n8n:latest

# 2. 切換成 root 權限，以便安裝系統工具
USER root

# 3. 安裝 ffmpeg (處理音訊分割) 以及中文字型 (避免未來 PDF 亂碼)
# 注意：n8n 官方映像檔是基於 Alpine Linux，所以使用 apk 指令
RUN apk add --no-cache ffmpeg ttf-freefont font-noto-cjk

# 4. 安裝完成後，切換回原本的 n8n 使用者，確保安全性
USER node
