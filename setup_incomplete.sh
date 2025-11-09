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

cp $HOME/Configuration/denebola/home.nix $HOME/.config/home-manager && echo "[Done] Copied home.nix to home-manager config"

# ------------------------------------------------------

# Installing some basic stuff
yes | dnf install hyprland vim neovim dolphin ripgrep zsh go cargo pip st docker docker-compose
yes | dnf remove firefox
curl https://github.com/omeiirr/quran-cli/blob/main/install.sh | bash
mkdir $HOME/.quran/
touch $HOME/.quran/config && echo "[Done] Installed quran-cli"

# Installing nvchad
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
cd $HOME/nvim/
rm .git
rm LICENSE
rm README.md

cp -r $HOME/Configuration/denebola/nvim $HOME/.config/ && echo "[Done] Copied nvim config"

# Initializing hyprland config
cp $HOME/Configuration/denebola/hyprland.conf $HOME/.config/hypr/

# Initializing zsh and omz config
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
cp $HOME/Configuration/denebola/zshrc $HOME/.zshrc && echo "[Done] Copied zshrc file to homedir"
chsh $(which zsh)
cp $HOME/Configuration/denebola/half-life-mod.zsh-theme $HOME/.oh-my-zsh/themes

# Initializing kitty
cp -r $HOME/Configuration/denebola/kitty $HOME/.config && echo "[Done] Copied kitty config"

# Installing and configuring quickshell
dnf copr enable errornointernet/quickshell
dnf install quickshell && echo "[Done] Installed quickshell (note: hyprland is configured to open the quickshell at boot)"

# swww installed using home manager first
echo "[info] swww is installed through home-manager and launched at boot through hyprland"

# Installing kanban board program
pip install rich
pip install kanban-cli && echo "[Done] Installed kanban-cli"

# Installing timer
pip install termdown && echo "[Done] Installed termdown"

# Direnv installation
curl -sfL https://direnv.net/install.sh | bash && echo "[Done] Installed direnv (note: nix-direnv is installed through home manager)"

# Salt installation
curl -fsSL https://github.com/saltstack/salt-install-guide/releases/latest/download/salt.repo | tee /etc/yum.repos.d/salt.repo
dnf clean expire-cache
yes | dnf install salt-master salt-minion salt-ssh salt-syndic salt-cloud salt-api && echo "[Done] Installed Saltstack"
