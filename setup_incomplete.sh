##################################################################
# Script for setting up the OS. Incomplete as of right now.      #
# If you don't trust the script to do everything for you,        #
# you can use it as a TOME playbook to quickly set everything up.#
##################################################################

# Setting up nix home manager --------------------------
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon

nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

nix-shell '<home-manager>' -A install

ln -s $HOME/.config/home-manager/home.nix $HOME/.config/sysconfig/desktop/denebola/nix/home.nix
# ------------------------------------------------------

# Installing some basic stuff
yes | dnf install hyprland neovim dolphin ripgrep zsh go cargo pip st docker docker-compose
yes | dnf remove firefox
curl https://github.com/omeiirr/quran-cli/blob/main/install.sh | bash
mkdir $HOME/.quran/
touch $HOME/.quran/config
# Arabiv font to render correctly
dnf install amiri-fonts

# Installing nvchad
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
cd $HOME/nvim/
rm .git
rm LICENSE
rm README.md

# Initializing hyprland config
cp $HOME/.config/sysconfig/desktop/denebola/hyprland.conf $HOME/.config/hypr/

# Initializing zsh and omz config
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
cp $HOME/.config/sysconfig/desktop/denebola/zshrc $HOME/.zshrc

# Choosing kitty theme
kitty +kitten themes

# Installing and configuring quickshell
dnf copr enable errornointernet/quickshell
dnf install quickshell

# Installing wallpaper manager
# swww installed using home manager first

sudo curl -sL $(curl -s https://api.github.com/repos/5hubham5ingh/WallRizz/releases/latest | grep -Po '"browser_download_url": "\K[^"]+' | grep WallRizz) | tar -xz && sudo mv WallRizz /usr/bin/

# Installing kanban board program
pip install rich
pip install kanban-cli

# Installing timer
pip install termdown

# Time management
go install -ldflags "-X github.com/wakatara/harsh/cmd.version=$(git describe --tags --always --dirty)" github.com/wakatara/harsh@latest
dnf install calcurse

# Direnv installation
curl -sfL https://direnv.net/install.sh | bash

# Salt installation
curl -fsSL https://github.com/saltstack/salt-install-guide/releases/latest/download/salt.repo | tee /etc/yum.repos.d/salt.repo
dnf clean expire-cache
yes | dnf install salt-master salt-minion salt-ssh salt-syndic salt-cloud salt-api
