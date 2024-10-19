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
    ffmpeg-full

    # nix
    nix-prefetch-git

    # tools
    imagemagick
    wmctrl
    connman-gtk
    blueman
    # screenkey
    pamixer
    pavucontrol
    maim
    # skippy-xd
    inotify-tools
    # qmk
    nsxiv

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
    (picom.overrideAttrs (oldAttrs: {
      src = fetchFromGitHub {
        owner = "yshui";
        repo = "picom";
        rev = "6caa76a281e906784deb05038e38919e878be6e0";
        sha256 = "09d8r8b3fdm29hh9ypys9zhq3aw33awlvgxw1py0nv3fachy566k";
      };
      buildInputs = oldAttrs.buildInputs ++ [ asciidoctor ];
    }))

    xcolor

    rofi-wayland
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
    resources
		jetbrains-toolbox
    vscode
		pkgs-unstable.boxbuddy
    # gnome.gnome-control-center
    pkgs-unstable.vesktop
    pkgs-unstable.obs-studio
    # pkgs-unstable.aseprite
    pkgs-unstable.lutris
    pkgs-unstable.gimp
    libreoffice-fresh
    # bleachbit
    libsForQt5.qt5ct
    ytmdl
    mate.engrampa
    pkgs-unstable.godot_4
    # (callPackage ../derivations/godot4-mono/default.nix { })
  ];
}
