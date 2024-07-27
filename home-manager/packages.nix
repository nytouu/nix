{ pkgs, inputs, ...}:
let 
		pkgs-unstable = import inputs.unstable { system = "x86_64-linux"; config.allowUnfree = true; };
in
{
  home.packages = with pkgs; [
    # system
    htop-vim
    bat eza
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

    # xorg
    xorg.xkill
    xorg.xinput
    xorg.xwininfo
    xorg.xdpyinfo
    xorg.xset
    xdotool
		arandr
    xclip
    pkgs-unstable.picom-pijulius
    # (picom.overrideAttrs (oldAttrs: rec {
    # 	src = fetchFromGitHub {
    # 		owner = "fdev31";
    # 		repo = "picom";
    # 		rev = "7834dd3147ba605bba5cbe911bacfa8b217c37e0";
    # 		sha256 = "05cd3yj3lv8nk433v0j2k86mhg72pf5lijkshqwarr8hp3h00cvx";
    # 	};
    # 	buildInputs = oldAttrs.buildInputs ++ [ pcre2 ];
    # }))
#    (picom.overrideAttrs (oldAttrs: rec {
#      pname = "compfy";
#      version = "1.7.2";
#      buildInputs = [
#        pcre2
#      ] ++ oldAttrs.buildInputs;
#      src = pkgs.fetchFromGitHub {
#        owner = "allusive-dev";
#        repo = "compfy";
#        rev = version;
#        hash = "sha256-7gKIOxFoiO0QFU9uaFbZZD9LzqH/TeaMImmCRYfg+uQ=";
#      };
#      postInstall = '''';
#    }))

    xcolor

    rofi
    rofi-pass
    rofi-power-menu

    # fonts
    # (callPackage ../derivations/nonicons/default.nix { })
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
    # vscode
    zathura
    mpv
    # vlc
    pkgs-unstable.aseprite
    pkgs-unstable.blender
    pkgs-unstable.lutris
    # blockbench-electron
    # lmms
    # nitrogen
    libreoffice-fresh
    # libresprite
    bleachbit
    libsForQt5.qt5ct
    # ytmdl
    mate.engrampa
    gimp
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
    gnumake cmake
    # mono5
    luarocks
    gcc
    # jetbrains-toolbox
    #dotnet-sdk
    #dotnet-sdk_7
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

    # omnisharp-roslyn
    csharp-ls
    # nodePackages_latest.browser-sync
  ];
}
