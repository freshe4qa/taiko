#!/bin/bash

while true
do

# Logo

echo -e '\e[40m\e[91m'
echo -e '  ____                  _                    '
echo -e ' / ___|_ __ _   _ _ __ | |_ ___  _ __        '
echo -e '| |   |  __| | | |  _ \| __/ _ \|  _ \       '
echo -e '| |___| |  | |_| | |_) | || (_) | | | |      '
echo -e ' \____|_|   \__  |  __/ \__\___/|_| |_|      '
echo -e '            |___/|_|                         '
echo -e '    _                 _                      '
echo -e '   / \   ___ __ _  __| | ___ _ __ ___  _   _ '
echo -e '  / _ \ / __/ _  |/ _  |/ _ \  _   _ \| | | |'
echo -e ' / ___ \ (_| (_| | (_| |  __/ | | | | | |_| |'
echo -e '/_/   \_\___\__ _|\__ _|\___|_| |_| |_|\__  |'
echo -e '                                       |___/ '
echo -e '\e[0m'

sleep 2

# Menu

PS3='Select an action: '
options=(
"Install"
"Exit")
select opt in "${options[@]}"
do
case $opt in

"Install")
echo "============================================================"
echo "Install start"
echo "============================================================"

# set vars
if [ ! $KEY ]; then
	read -p "Enter private key: " KEY
	echo 'export KEY='$KEY >> $HOME/.bash_profile
fi
if [ ! $ADDRESS ]; then
	read -p "Enter ETH address: " ADDRESS
	echo 'export ADDRESS='$ADDRESS >> $HOME/.bash_profile
fi
source $HOME/.bash_profile

# update
sudo apt update && sudo apt upgrade -y

# packages
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    -y

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg > /dev/null

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# download binary
cd $HOME
git clone https://github.com/taikoxyz/simple-taiko-node.git
cd simple-taiko-node
cp .env.sample .env

sed -i -e "s/ENABLE_PROPOSER = false/ENABLE_PROPOSER = true/" $HOME/simple-taiko-node/.env
sed -i -e "s/^L1_PROPOSER_PRIVATE_KEY *=.*/L1_PROPOSER_PRIVATE_KEY = \"$KEY\"/" $HOME/simple-taiko-node/.env
sed -i -e "s/^L2_SUGGESTED_FEE_RECIPIENT *=.*/L2_SUGGESTED_FEE_RECIPIENT = \"$ADDRESS\"/" $HOME/simple-taiko-node/.env


# start service
docker compose up -d

break
;;

"Exit")
exit
;;
*) echo "invalid option $REPLY";;
esac
done
done
