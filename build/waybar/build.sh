docker build -t wjdp/waybar .
docker run --rm -v $(pwd)/waybar:/waybar wjdp/waybar inner.sh
