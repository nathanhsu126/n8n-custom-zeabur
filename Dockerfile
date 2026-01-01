# 1. 使用 n8n 官方最新版
FROM n8nio/n8n:latest

# 2. 切換成 root 權限進行檔案操作
USER root

# 3. 安裝 FFmpeg (靜態編譯版)
# 解說：直接從官網下載已編譯好的執行檔，解壓縮後搬移到系統路徑
RUN curl -O https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz && \
    tar xvf ffmpeg-release-amd64-static.tar.xz && \
    mv ffmpeg-*-amd64-static/ffmpeg /usr/local/bin/ && \
    mv ffmpeg-*-amd64-static/ffprobe /usr/local/bin/ && \
    rm -rf ffmpeg-* ffmpeg-release-amd64-static.tar.xz

# 4. 安裝中文字型 (Noto Sans TC)
# 解說：手動建立字型目錄並下載 Google 的繁體中文字型，解決 PDF 亂碼問題
RUN mkdir -p /usr/share/fonts/noto && \
    curl -L https://github.com/google/fonts/raw/main/ofl/notosanstc/NotoSansTC-Regular.ttf -o /usr/share/fonts/noto/NotoSansTC-Regular.ttf && \
    chmod 644 /usr/share/fonts/noto/NotoSansTC-Regular.ttf

# 5. 切換回 n8n 使用者
USER node
