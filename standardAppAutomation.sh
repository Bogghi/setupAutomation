#installing vagrant
#----------------------
sudo apt update
sudo apt install vagrant
#installing vscode
#----------------------
sudo apt install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -

$repo = ll /etc/apt/sources.list.d | grep vscode
if [! -z $repo]; then  
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
sudo apt update && apt install code 
fi

#installing dbeaver
#----------------------
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -
$repo = ll /etc/apt/sources.list.d | grep dbeaver
if [! -z $repo]; then  
echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
sudo apt update && sudo apt -y  install dbeaver-ce
fi

#installing docker
#----------------------
sudo apt update && sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

$repo = ll /etc/apt/sources.list.d | grep docker
if [! -z $repo]; then
echo "deb [arch=amd64] https://download.docker.com/linux/debian buster stable"
sudo apt update && sudo apt-get install docker-ce docker-ce-cli containerd.io
fi

sudo docker run hello-world