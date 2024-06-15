# this script install all the listed items
# export DEBIAN_FRONTEND=noninteractive

sudo mkdir -p /tmp/installs
cd /tmp/installs

sudo apt update

#
#       homebrew
#
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

#
#       snapcraft
#
sudo apt install snapd

#
#       terminator
#
sudo add-apt-repository ppa:mattrose/terminator
sudo apt-get update
sudo apt install terminator

#
#       google chrome 
#
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

#
#       nvim 
#
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

#
#       Nv chad
#
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
# remove the current config and import my config from the repo
rm -rf ~/.config/nvim/
git clone https://github.com/0xbyt3z/nvim-config.git ~/.config/nvim/


#
#       node js lts
#
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
nvm install --lts
# install pnpm 
npm install -g pnpm

#
#       ripgrep,fzf,exa
#
sudo apt-get install ripgrep
sudo apt install fzf
sudo apt install exa

#
#        rust
#
curl https://sh.rustup.rs -sSf | sh -s -- -y

#
#       postman, vscode
#
sudo snap install postman
sudo snap install code --classic

#
#       free download manager
#
wget -qO- https://files2.freedownloadmanager.org/6/latest/freedownloadmanager.deb
sudo dpkg --install freedownloadmanager.deb

#
#     k8s lens
#
sudo snap install kontena-lens --classic

#
#       docker engine
#
wget -qO- https://desktop.docker.com/linux/main/amd64/149282/docker-desktop-4.30.0-amd64.deb
sudo dpkg --install docker-desktop-4.30.0-amd64.deb

#
#       terraform
#
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform

#
#       aws cli 
#
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

#
#       azure cli
#
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

#
#       github cli
#
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y


#
#     conda
#
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh






#
########### update .bashrc #############
#
cat ./file_updates.txt >> ~/.bashrc
