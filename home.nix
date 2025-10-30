{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "saku";
  home.homeDirectory = "/home/saku";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
    "obsidian"
    "vivaldi"
  ];
  # The home.packages option allows you to install Nix packages into your
  # environment.
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
# misc    
    vesktop
    neofetch
    obs-studio
    ani-cli
    gimp
    vivaldi
    polkit
    inkscape
    tree
    pstree
    swww
    onefetch
# cybersec / systems related stuff
    wget
    xz
    unixtools.netstat
    arp-scan-rs
    nmap
    tcpdump
    netcat
    unixtools.arp
    dig
    ubootTools
    rpi-imager
    shellcheck
    libisoburn
    openssl
    binsider
    binwalk
    xh
# dev-related stuff
    vim
    tldr
    python312
    ruby
    hare
    git
    ripgrep
    hyperfine
# basic utilities
    ffmpeg
    pavucontrol
    librewolf
    pamixer
    rofi
    grim
    wl-clipboard
    unzip
    ncdu
    phototonic
    vlc
    slurp
    detox
    backdown
# distrobox => for vms
# bocker => for vms
    pdftk
# organization stuff
    obsidian
    d2
    asciidoc
    ascii
    ntfy-sh
# shell-related
    zellij
    btop
    fzf
    bat
    eza
    projectable

  ];
  # Home Manager is pretty good at managing dotfiles. The primary way to manage

  
programs.zellij.enable = true;
programs.zellij.settings.theme = "ao";
programs.zellij.settings.enableZshIntegration = true;
programs.zellij.settings.show_startup_tips = false;
programs.zellij.settings.pane_frames = false;
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/saku/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
