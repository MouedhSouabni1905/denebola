# Denebola
The user-end part of my system configuration I'm working on, which mixes both the usual way of ricing linux (ie. config files) for system-tied services like zsh, hyperland, quickshell, and the nix package manager for managing applications and their configuration declaratively. it might or might not work on your system, I haven't tested it anywhere yet as it is still incomplete.

### > Directory structure:
```
.
├── home.nix
├── hyprland.conf
├── kitty
│   ├── current-theme.conf
│   ├── dark-theme.auto.conf
│   ├── kitty.conf
│   ├── kitty.conf.bak
│   └── themes
│       └── denebola.conf
├── nvim
│   ├── init.lua
│   ├── lazy-lock.json
│   └── lua
│       ├── autocmds.lua
│       ├── chadrc.lua
│       ├── configs
│       │   ├── conform.lua
│       │   ├── lazy.lua
│       │   └── lspconfig.lua
│       ├── mappings.lua
│       ├── options.lua
│       ├── plugins
│       │   ├── init.lua
│       │   └── obsidian.lua
│       └── themes
│           └── denebola.lua
├── quickshell
│   ├── horizontal_bar
│   │   ├── Clock.qml
│   │   ├── Time.qml
│   │   └── TopBar.qml
│   ├── shell.qml
│   ├── themes
│   │   └── Theme.qml
│   └── vertical_bar
│       └── VertBar.qml
├── README.md
├── setup_incomplete.sh
├── vivalditheme
├── wallpapers
│   ├── bluePixelWallpaper.png
│   ├── nohup.out
│   ├── wallhaven-d6qwkg.png
│   ├── wallhaven-jxzmzq.png
│   ├── wallhaven-rddyp1.png
│   └── wallhaven-v9pgj3.png
└── zshrc

13 directories, 35 files
```
