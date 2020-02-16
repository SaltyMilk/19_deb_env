echo "Setting up environment..."
docker build -t 19deb_img ../ \
&& docker run -d --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --name 19deb 19deb_img

echo "Connect to your debian environment with log.sh"
