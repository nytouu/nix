{
  inputs,
  config,
  pkgs,
  ...
}:
let
  pkgs-unstable = import inputs.unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
in
{
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    overlays = [
      (final: prev: {
        steam = prev.steam.override (
          {
            extraPkgs ? pkgs': [ ],
            ...
          }:
          {
            extraPkgs =
              pkgs':
              (extraPkgs pkgs')
              ++ (with pkgs'; [
                libgdiplus
              ]);
          }
        );
      })
      (final: prev: {
        sf-mono-liga-bin = prev.stdenvNoCC.mkDerivation rec {
          pname = "sf-mono-liga-bin";
          version = "dev";
          src = inputs.sf-mono-liga-src;
          dontConfigure = true;
          installPhase = ''
            mkdir -p $out/share/fonts/opentype
            cp -R $src/*.otf $out/share/fonts/opentype/
          '';
        };
      })
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    settings = {
      experimental-features = "nix-command flakes";
      auto-optimise-store = true;
      substituters = [
        "https://nix-gaming.cachix.org"
      ];
      trusted-public-keys = [
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];
    };
  };

  networking.hostName = "nixos";

  services.connman = {
    enable = true;
    wifi.backend = "iwd";
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  time.timeZone = "Europe/Paris";
  time.hardwareClockInLocalTime = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Bootloader.
  boot.supportedFilesystems = [ "ntfs" ];
  boot.loader = {
    systemd-boot = {
      enable = false;
      consoleMode = "max";
      configurationLimit = 25;
    };
    efi.canTouchEfiVariables = true;
    timeout = 1;

    # efi.efiSysMountPoint = "/boot/efi";
    grub = {
      enable = true;
      useOSProber = true;
      device = "nodev";
      # backgroundColor = "#000000";
      # fsIdentifier = "label";
      # efiInstallAsRemovable = true;
      gfxmodeEfi = "1920x1080";
      efiSupport = true;
      configurationLimit = 10;
      default = "saved";
    };
  };

  # Setup keyfile
  boot.initrd = {
    systemd.enable = true;
  };

  boot.kernelParams = [
    "quiet"
    "splash"
    "initcall_blacklist=amd_pstate_init"
    "amd_pstate.enable=0"
    "nvidia.NVreg_PreserveVideoMemoryAllocations=1"
  ];
  boot.consoleLogLevel = 0;

  boot.plymouth = {
    enable = true;
  };

  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "JetBrainsMono"
          "IBMPlexMono"
          "MartianMono"
        ];
      })
      sf-mono-liga-bin
      ibm-plex
      noto-fonts
      noto-fonts-cjk
      jetbrains-mono
      siji
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        sansSerif = [ "Torus Pro" ];
        # monospace = [ "Liga SFMono Nerd Font" ];
        # sansSerif = [ "SF Pro Display" ];
        monospace = [ "MartianMono Nerd Font" ];
        serif = [ "Noto Serif" ];
      };
    };
  };

  services.libinput = {
    enable = true;
    touchpad = {
      tapping = true;
      naturalScrolling = true;
      scrollMethod = "twofinger";
      disableWhileTyping = true;
      clickMethod = "clickfinger";
      accelProfile = "flat";
    };
    mouse = {
      accelProfile = "flat";
      accelSpeed = "-0.25";
    };
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    # package = pkgs-unstable.hyprland;
  };

  # Configure X11
  services.xserver = {
    enable = true;
    xkb.layout = "fr";

    windowManager.awesome = {
      package = pkgs.awesome-git;
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks
        luadbi-mysql
        lgi
      ];
    };
    windowManager.dwm = {
      enable = false;
      package = pkgs.dwm.overrideAttrs (oldAttrs: {
        src = ../dwm;
        buildInputs =
          with pkgs;
          oldAttrs.buildInputs
          ++ [
            imlib2
            yajl
          ];
      });
    };

    desktopManager.xterm.enable = false;
    updateDbusEnvironment = true;
  };

  services.displayManager = {
    defaultSession = "none+awesome";
    autoLogin = {
      enable = true;
      user = "nytou";
    };
    sddm = {
      enable = true;
      autoNumlock = true;
      theme = "${import ../derivations/sddm-corners/default.nix { inherit pkgs; }}";
    };
  };

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };
  hardware.nvidia-container-toolkit.enable = true;

  environment = {
    systemPackages = with pkgs; [
      distrobox

      pulseaudio
      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtgraphicaleffects
      libsForQt5.qt5.qtsvg
      git

      hyprlandPlugins.borders-plus-plus
      hyprlandPlugins.csgo-vulkan-fix

      gtk3
      adw-gtk3
      gsettings-desktop-schemas

      man-pages
      man-pages-posix

      (unityhub.override {
        extraPkgs = fhsPkgs: [
          fhsPkgs.harfbuzz
          fhsPkgs.libogg

          fhsPkgs.vulkan-tools
          fhsPkgs.vulkan-loader
          fhsPkgs.vulkan-helper
          fhsPkgs.vulkan-headers
          fhsPkgs.vulkan-extension-layer
          fhsPkgs.vulkan-validation-layers
          fhsPkgs.vulkan-utility-libraries
          fhsPkgs.mono
          fhsPkgs.mesa
          fhsPkgs.glibc
        ];
      })
    ];

    variables = rec {
      GSETTINGS_SCHEMA_DIR = "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
    };

    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
      AWESOME_PATH = "${pkgs.awesome}";
      ADW_DISABLE_PORTAL = "1";
    };
  };

  console.keyMap = "fr";

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    powerManagement.enable = true;
    powerManagement.finegrained = false;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      amdgpuBusId = "PCI:7:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  security.rtkit.enable = true;

  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    wireplumber.enable = true;
    pulse.enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    extraConfig = {
      pipewire."92-low-latency" = {
        "context.properties" = {
          "default.clock.rate" = 48000;
          "default.clock.min-quantum" = 128;
        };
      };
      pipewire-pulse."92-low-latency" = {
        "context.properties" = [
          {
            name = "libpipewire-module-protocol-pulse";
            args = { };
          }
        ];
        "pulse.properties" = {
          "pulse.min.req" = "32/48000";
          "pulse.min.quantum" = "32/48000";
        };
        "stream.properties" = {
          "node.latency" = "32/48000";
          "resample.quality" = 1;
        };
      };
    };
  };

  powerManagement.enable = true;
  services.auto-cpufreq = {
    enable = true;
    settings = {
      battery = {
        governor = "powersave";
        turbo = "never";
      };
      charger = {
        governor = "performance";
        turbo = "auto";
      };
    };
  };
  services.tlp = {
    enable = false;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 20;

      START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge
      STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
    };
  };

  services.printing = {
    enable = false;
    drivers = with pkgs; [
      gutenprint
    ];
  };
  services.avahi.enable = false;

  environment.shells = with pkgs; [ zsh ];
  environment.pathsToLink = [ "/share/zsh" ];

  programs.zsh.enable = true;
  environment.binsh = "${pkgs.dash}/bin/dash";

  programs.dconf.enable = true;
  services.gnome.evolution-data-server.enable = false;
  services.gnome.gnome-online-accounts.enable = false;
  services.gvfs.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.sddm.enableGnomeKeyring = true;

  programs.xfconf.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-volman
      tumbler
    ];
  };

  services.upower.enable = false;

  hardware.opentabletdriver.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
	hardware.xpadneo.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config = {
      common = {
        default = [
          "gtk"
        ];
      };
    };
  };

  security.polkit.enable = true;

  security.pam.loginLimits = [
    {
      domain = "*";
      type = "soft";
      item = "nofile";
      value = "4096";
    }
  ];

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-gnome3;
    enableSSHSupport = false;
  };

  security.sudo.enable = false;
  security.doas = {
    enable = true;
    extraRules = [
      {
        users = [ "nytou" ];
        persist = true;
      }
    ];
  };

  users.users = {
    nytou = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      extraGroups = [
        "networkmanager"
        "wheel"
        "plugdev"
        "input"
        "video"
      ];
      shell = pkgs.zsh;
    };
  };

  services.openssh = {
    enable = false;
    # permitRootLogin = "no";
    # passwordAuthentication = false;
  };

  # system.autoUpgrade.enable = true;
  # system.autoUpgrade.allowReboot = true;
  # system.autoUpgrade.channel = "https://channels.nixos.org/nixos-23.11";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
