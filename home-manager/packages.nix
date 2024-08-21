{ pkgs, inputs, ...}:
let 
		pkgs-unstable = import inputs.unstable { system = "x86_64-linux"; config.allowUnfree = true; };
in
{
  home.packages = with pkgs; [
    # system
    htop-vim
    bat eza
    slop
    firejail
    unzip unrar p7zip
    btrfs-progs acpi
    pinentry-curses libnotify
    wirelesstools wget
    procps psmisc brightnessctl
		python311Packages.psutil
    python311Packages.types-psutil
    # python311Packages.pip

    # nix
    nix-prefetch-git

    # tools
    imagemagick
    tesseract
    wmctrl
    playerctl
    connman-gtk
    blueman
    pass 
		screenkey
    # feh
    pamixer pulsemixer 
		pavucontrol
    lazygit neofetch
    maim
		skippy-xd
    ffmpegthumbnailer
    xfce.thunar
    xfce.thunar-archive-plugin 
    xfce.thunar-volman 
    xfce.xfconf
    xfce.tumbler
    # inotify-tools
    # qmk
    # (callPackage ../derivations/hydrablocks/default.nix { })
    nsxiv
		betterlockscreen
    eww

    # xorg
    xorg.xkill
    xorg.xinput
    xorg.xwininfo
    xorg.xdpyinfo
    xorg.xset
		xwinwrap
    xdotool
		arandr
    xclip
    # pkgs-unstable.picom-pijulius
    (picom.overrideAttrs (oldAttrs: {
    	src = fetchFromGitHub {
    		owner = "yshui";
    		repo = "picom";
    		rev = "bc455e866e253c822324244df1c2aeb5c7f8c620";
    		sha256 = "16by8ar16yx2j381dzxx8407mk3qbgrjkka3vbar5frphnwz500x";
    	};
      buildInputs = oldAttrs.buildInputs ++ [ asciidoctor ];
    }))
		(dwmblocks.overrideAttrs (oldAttrs: {
			src = ../dwmblocks;
		}))

    xcolor

    rofi
    rofi-power-menu

    # fonts
    (callPackage ../derivations/nonicons/default.nix { })
    (callPackage ../derivations/nerd-symbols/default.nix { })
    (callPackage ../derivations/torus-pro/default.nix { })
    (callPackage ../derivations/sf-pro-fonts/default.nix { })
    material-icons

    # neovim
    # neovim-remote
    ripgrep fd
    # neovide

    # apps
    # audacity
    # teams-for-linux
    gnome.gnome-calendar
    # gnome.gnome-system-monitor
    gnome.gnome-control-center
    pkgs-unstable.vesktop
    pkgs-unstable.obs-studio
    pkgs-unstable.planify
    # vscode
    zathura
    mpv
    # vlc
    pkgs-unstable.aseprite
    pkgs-unstable.blender
    pkgs-unstable.lutris
    pkgs-unstable.gimp
    libreoffice-fresh
    bleachbit
    libsForQt5.qt5ct
    ytmdl
    mate.engrampa
    godot_4
    # (callPackage ../derivations/godot4-mono/default.nix { })
    (unityhub.override {
        extraLibs = pkgs: with pkgs; [
            openssl_1_1
            gradle
            # glibc
        ];
    })

    # dev
    rustc
    cargo
    meson ninja nodejs
    # clang
    gnumake cmake
    # mono5
    luarocks
    python3
    gcc
    # jetbrains-toolbox
    go
    dotnetCorePackages.sdk_9_0
    # android-tools
    # android-udev-rules
    # android-studio

    # python3

    #nvim stuff
    tree-sitter

    nixfmt-classic
    nil

    rust-analyzer
    rustfmt

    # lua
    stylua lua-language-server
    lua51Packages.lua
    llvmPackages.libclang

    nodePackages.bash-language-server

    csharp-ls
  ];
}
