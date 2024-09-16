{ pkgs, inputs, ... }:
let
  pkgs-unstable = import inputs.unstable { system = "x86_64-linux"; config.allowUnfree = true; };
in
{
  programs = with pkgs; {
    bat.enable = true;
    eza.enable = true;
    htop = {
      enable = true;
      package = htop-vim;
    };
    fastfetch.enable = true;
    fd.enable = true;
    ripgrep.enable = true;

    zathura.enable = true;
    mpv = {
      enable = true;
      bindings = {
        WHEEL_UP = "volume 5";
        WHEEL_DOWN = "volume -5";
      };
    };
  };

  home.packages = with pkgs; [
    # system
    slop
    firejail
    unzip
    unrar
    p7zip
    btrfs-progs
    acpi
    # pinentry-curses
    libnotify
    wirelesstools
    wget
    procps
    psmisc
    brightnessctl
    python311Packages.psutil
    python311Packages.types-psutil
    ffmpegthumbnailer

    # nix
    nix-prefetch-git

    # tools
    imagemagick
    # tesseract
    wmctrl
    connman-gtk
    blueman
    # pass
    # screenkey
    # feh
    pamixer
    # pulsemixer 
    pavucontrol
    maim
    # skippy-xd
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    xfce.xfconf
    xfce.tumbler
    inotify-tools
    # qmk
    # (callPackage ../derivations/hydrablocks/default.nix { })
    nsxiv
    # betterlockscreen
    # eww

    # xorg
    xorg.xkill
    xorg.xinput
    xorg.xwininfo
    xorg.xdpyinfo
    xorg.xset
    # xwinwrap
    xdotool
    arandr
    xclip
    # pkgs-unstable.picom-pijulius
    (picom.overrideAttrs (oldAttrs: {
      src = fetchFromGitHub {
        owner = "yshui";
        repo = "picom";
        rev = "3899d2c4cdd902623592aab7839c8da91fbce86c";
        sha256 = "14wwi74m5k4fqa5c7cvn3adbakbc1v59f46vjgkk5qzqr6pma7yc";
      };
      buildInputs = oldAttrs.buildInputs ++ [ asciidoctor ];
    }))
    # (dwmblocks.overrideAttrs (oldAttrs: {
    # 	src = ../dwmblocks;
    # }))

    xcolor

    rofi
    # rofi-power-menu

    # fonts
    (callPackage ../derivations/nonicons/default.nix { })
    (callPackage ../derivations/nerd-symbols/default.nix { })
    (callPackage ../derivations/torus-pro/default.nix { })
    (callPackage ../derivations/sf-pro-fonts/default.nix { })
    material-icons

    # neovim
    # neovim-remote
    # neovide

    # apps
    # audacity
    teams-for-linux
    gnome.gnome-calendar
    gnome-secrets
    gnome.gnome-system-monitor
    # gnome.gnome-control-center
    pkgs-unstable.vesktop
    pkgs-unstable.obs-studio
    # pkgs-unstable.planify
    # vscode
    # vlc
    # pkgs-unstable.aseprite
    # pkgs-unstable.blender
    pkgs-unstable.lutris
    pkgs-unstable.gimp
    libreoffice-fresh
    # bleachbit
    libsForQt5.qt5ct
    ytmdl
    mate.engrampa
    # godot_4
    # (callPackage ../derivations/godot4-mono/default.nix { })
    (unityhub.override {
      extraLibs = pkgs: with pkgs; [
        openssl_1_1
        gradle
        # glibc
      ];
    })
  ];
}
