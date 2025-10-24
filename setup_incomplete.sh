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
yes | dnf install hyprland
yes | dnf install neovim
yes | dnf install dolphin
yes | dnf install ripgrep
yes | dnf install zsh
yes | dnf remove firefox

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
