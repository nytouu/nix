				{ inputs, config, pkgs, ... }: 

{
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    overlays = [
      (final: prev: {
        steam = prev.steam.override ({ extraPkgs ? pkgs': [], ... }: {
          extraPkgs = pkgs': (extraPkgs pkgs') ++ (with pkgs'; [
            libgdiplus
          ]);
        });
      })
      (final: prev: {
        awesome = inputs.nixpkgs-f2k.packages.${pkgs.system}.awesome-git;
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
      substituters = ["https://nix-gaming.cachix.org"];
      trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
    };
  };

  networking.hostName = "nixos";
  # networking.networkmanager.enable = false;

  services.connman = {
    enable = true;
    wifi.backend = "iwd";
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = false;
  };

  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
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

  # boot.kernelParams = [ "quiet" ];
  boot.kernelParams = [ "quiet" "splash" "initcall_blacklist=amd_pstate_init" "amd_pstate.enable=0" ];
  boot.consoleLogLevel = 0;

  boot.plymouth = {
    enable = true;
  };

  fonts = {
    packages = with pkgs; [
      (nerdfonts.override { fonts = [
        "JetBrainsMono"
        "IBMPlexMono"
        "MartianMono"
      ]; })
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
        # monospace = [ "Liga SFMono Nerd Font" ];
        # sansSerif = [ "SF Pro Display" ];
        monospace = [ "MartianMono Nerd Font" ];
        serif = [ "Noto Serif" ];
        sansSerif = [ "Torus Pro" ];
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
	};

  # Configure X11
  services.xserver = {
    enable = true;
    xkb.layout = "fr";

    windowManager.awesome = {
      enable = false;
      luaModules = with pkgs.luaPackages; [
        luarocks # is the package manager for Lua modules
        luadbi-mysql # Database abstraction layer
      ];
    };
		windowManager.dwm = {
			enable = true;
			package = pkgs.dwm.overrideAttrs {
				src = ./dwm;
			};
		};

    desktopManager.xterm.enable = false;

    updateDbusEnvironment = true;

  };
  services.displayManager = {
    defaultSession = "none+dwm";
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

  environment = {
    systemPackages = with pkgs; [
      pulseaudio
      libsForQt5.qt5.qtquickcontrols2
      libsForQt5.qt5.qtgraphicaleffects
      libsForQt5.qt5.qtsvg
      git
    ];

    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
			AWESOME_PATH = "${pkgs.awesome}";
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
    # extraConfig = {
    #   pipewire."92-low-latency" = {
    #     "context.properties" = {
    #       "default.clock.rate" = 48000;
    #       "default.clock.quantum" = 128;
    #       "default.clock.min-quantum" = 128;
    #       "default.clock.max-quantum" = 128;
    #     };
    #   };
    #   pipewire-pulse."92-low-latency" = {
    #     "context.properties" = [
    #     {
    #       name = "libpipewire-module-protocol-pulse";
    #       args = { };
    #     }
    #     ];
    #     "pulse.properties" = {
    #       "pulse.min.req" = "128/48000";
    #       "pulse.default.req" = "128/48000";
    #       "pulse.max.req" = "128/48000";
    #       "pulse.min.quantum" = "128/48000";
    #       "pulse.max.quantum" = "128/48000";
    #     };
    #     "stream.properties" = {
    #       "node.latency" = "128/48000";
    #       "resample.quality" = 1;
    #     };
    #   };
    # };
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

  services.printing.enable = true;

  environment.shells = with pkgs; [ zsh ];
  environment.pathsToLink = [ "/share/zsh" ];

  programs.zsh.enable = true;
  environment.binsh = "${pkgs.dash}/bin/dash";

  programs.dconf.enable = true;
  services.gnome.evolution-data-server.enable = true;
  services.gnome.gnome-online-accounts.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.gvfs.enable = true;

  services.upower.enable = true;

  hardware.opentabletdriver.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

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
    pinentryPackage = pkgs.ncurses;
    enableSSHSupport = true;
  };

  security.sudo.enable = false;
  security.doas = {
    enable = true;
    extraRules = [
      { users = [ "nytou" ]; persist = true; }
    ];
  };

  users.users = {
    nytou = {
      # initialPassword = "correcthorsebatterystaple";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      extraGroups = [ "networkmanager" "wheel" "plugdev" "input" "video" ];
      shell = pkgs.zsh;
    };
  };

  services.openssh = {
    enable = true;
    # permitRootLogin = "no";
    # passwordAuthentication = false;
  };

  # system.autoUpgrade.enable = true;
  # system.autoUpgrade.allowReboot = true;
  # system.autoUpgrade.channel = "https://channels.nixos.org/nixos-23.11";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "24.05";
}
