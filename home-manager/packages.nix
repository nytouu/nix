{ pkgs, ...}:
{
  home.packages = with pkgs; [
    # system
    htop-vim
    bat eza
    unzip unrar p7zip
    btrfs-progs acpi
    pinentry-curses libnotify
    wirelesstools wget
    procps psmisc brightnessctl

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
    # inotify-tools
    qmk 
    # (callPackage ../derivations/hydrablocks/default.nix { })
    nsxiv

    # xorg
    xorg.xkill
    xorg.xinput
    xorg.xwininfo
    xorg.xdpyinfo
    xorg.xset
    xdotool
		arandr
    xclip
    # picom
    # (picom.overrideAttrs (oldAttrs: rec {
    # 	src = fetchFromGitHub {
    # 		owner = "fdev31";
    # 		repo = "picom";
    # 		rev = "7834dd3147ba605bba5cbe911bacfa8b217c37e0";
    # 		sha256 = "05cd3yj3lv8nk433v0j2k86mhg72pf5lijkshqwarr8hp3h00cvx";
    # 	};
    # 	buildInputs = oldAttrs.buildInputs ++ [ pcre2 ];
    # }))
    (picom.overrideAttrs (oldAttrs: rec {
      pname = "compfy";
      version = "1.7.2";
      buildInputs = [
        pcre2
      ]
      ++
        oldAttrs.buildInputs;
      src = pkgs.fetchFromGitHub {
        owner = "allusive-dev";
        repo = "compfy";
        rev = version;
        hash = "sha256-7hvzwLEG5OpJzsrYa2AaIW8X0CPyOnTLxz+rgWteNYY=";
      };
      postInstall = '''';
    }))

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
    obs-studio
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
    jetbrains-toolbox
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
    mono5
    luarocks
    # luajit
    gcc
    android-tools
    android-udev-rules
    android-studio

    #nvim stuff
    tree-sitter
    # ueberzugpp

    nixfmt
    nil

    rust-analyzer
    rustfmt

    lua stylua lua-language-server
    llvmPackages_9.libclang

    nodePackages.bash-language-server

    omnisharp-roslyn
    csharp-ls
    # nodePackages_latest.browser-sync
  ];
}
