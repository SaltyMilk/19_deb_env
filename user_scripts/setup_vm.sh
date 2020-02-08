echo "Setting up environment..."
#./docker-setup.sh \
docker build -t 19ctf_img ../ \
&& docker run -d --name 19ctf 19ctf_img
echo "Connect to your debian environment with log.sh"
