{ pkgs, ...}:
{
  home.packages = with pkgs; [
    # system
    htop-vim
    bat eza
    unzip unrar p7zip
    btrfs-progs acpi
    pinentry-curses
    libnotify

    # nix
    nix-prefetch-git

    # tools
    imagemagick
    wmctrl
    playerctl
    connman-gtk
    pass 
    feh
    pamixer pulsemixer
    lazygit neofetch
    maim skippy-xd
    ffmpegthumbnailer
    (xfce.thunar.override { 
      thunarPlugins = with pkgs.xfce; [
        thunar-archive-plugin 
        thunar-volman 
      ]; 
    })
    xfce.tumbler
    qmk 
    # (callPackage ../derivations/hydrablocks/default.nix { })
    nsxiv
    betterlockscreen
    # xorg
    xorg.xkill
    xorg.xinput
    xorg.xwininfo
    xorg.xset
    xclip
    picom
    # (picom.overrideAttrs (oldAttrs: rec {
    # 	src = fetchFromGitHub {
    # 		owner = "fdev31";
    # 		repo = "picom";
    # 		rev = "7834dd3147ba605bba5cbe911bacfa8b217c37e0";
    # 		sha256 = "05cd3yj3lv8nk433v0j2k86mhg72pf5lijkshqwarr8hp3h00cvx";
    # 	};
    # 	buildInputs = oldAttrs.buildInputs ++ [ pcre2 ];
    # }))

    xcolor

    rofi
    rofi-pass
    rofi-power-menu

    # fonts
    # (callPackage ../derivations/nonicons/default.nix { })
    (callPackage ../derivations/nerd-symbols/default.nix { })
    (callPackage ../derivations/torus-pro/default.nix { })
    material-icons

    # neovim
    neovim-remote
    ripgrep fd
    # neovide

    helix

    # apps

    # teams-for-linux
    discord
    vscode
    zathura
    # mpv
    vlc
    # aseprite
    (callPackage ../derivations/aseprite/default.nix { })
    # libresprite
    # bleachbit
    libsForQt5.qt5ct
    ytmdl
    mate.engrampa
    gimp
    # unstable.godot_4
    # (callPackage ../derivations/godot/default.nix { })
    (unityhub.override {
        extraLibs = pkgs: with pkgs; [
            openssl_1_1
            gradle
            # glibc
        ];
    })

    # inputs.nixpkgs-unstable.pkgs.${pkgs.system}.unityhub
    # unityhub
    blender
    lmms
    # nitrogen
    # obs-studio
    # libsForQt5.kdeconnect-kde
    libreoffice-fresh

    # dev

    # rustup
    rustc
    # jetbrains-toolbox
    # mold
    cargo
    meson ninja nodejs
    gnumake cmake
    # xorg.libX11
    # xorg.libXcursor xorg.libXi xorg.libXrandr
    # libxkbcommon
    # alsa-lib vulkan-loader
    # pkg-config
    # xorg.libXcursor xorg.libXrandr xorg.libXi
    # vulkan-tools lutris vulkan-headers vulkan-loader 
    # vulkan-validation-layers alsaLib 
    # udev
    # libudev-zero
    # clang
    # clang-tools
    # dotnet-sdk
    # mono
    luarocks
    # luajit
    gcc
    android-tools
    android-udev-rules

    #nvim stuff
    tree-sitter
    ascii-image-converter
    # ueberzugpp

    nixfmt
    nil

    rust-analyzer
    rustfmt

    lua stylua lua-language-server
    llvmPackages_9.libclang

    omnisharp-roslyn
    # nodePackages_latest.browser-sync
  ];
}
