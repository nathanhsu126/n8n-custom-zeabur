# 1. 使用 n8n 官方最新版
FROM n8nio/n8n:latest

# 2. 切換成 root 權限進行檔案操作
USER root

# 5. 切換回 n8n 使用者
USER node
