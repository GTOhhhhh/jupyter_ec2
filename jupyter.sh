

#!/bin/bash
echo "This script will install Docker for Ubuntu EC2 then launch
 an encrypted Juptyer Notebook inside the docker container"
sudo apt-get -y install language-pack-en
sudo apt-get -y update
sudo apt-get -y full-upgrade
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg |
sudo apt-key add
echo "Checking docker installer gpg key..."
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu xenial stable"
sudo apt-get update
sudo apt-get -y install docker-ce
sudo usermod -aG docker $USER
echo "Building docker notebook image"
container=`sudo docker build . | tail -c 13`
echo "### container_id = $container ### "
sudo docker run -it --rm -p 8888:8888 -v /usr/proj/ripe:/home/jovyan/work -e GEN_CERT=yes $container start-notebook.sh
