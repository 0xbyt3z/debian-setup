# this script install all the listed items

sudo mkdir -p /tmp/installs
cd /tmp/installs

sudo apt update

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
