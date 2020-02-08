echo "Setting up environment..."
#./docker-setup.sh \
docker build -t 19deb_img ../ \
&& docker run -d --name 19deb 19deb_img

echo "Connect to your debian environment with log.sh"
