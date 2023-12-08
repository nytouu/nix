{ inputs, lib, config, pkgs, ... }: 

{
  imports = [
    ./zsh.nix
	./theme.nix
	./packages.nix
	./terminal.nix
    ./x.nix
	# ./nvim.nix
	./files.nix
	./music.nix
    ./browser.nix
	./games.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
      permittedInsecurePackages = [
        "electron-13.6.9"
		# "electron-24.8.6"
        "python-2.7.18.6"
		"openssl-1.1.1u"
		"openssl-1.1.1w"
      ];
    };
  };
  
  home = {
    username = "nytou";
    homeDirectory = "/home/nytou";
  };

  # manual.manpages.enable = false;

  programs.java.enable = true;

  programs.gpg.enable = true;
  services.gpg-agent.enable = true;

  xdg = {
    enable = true;

    userDirs = {
        enable = true;
        desktop = "${config.home.homeDirectory}/docs/desktop";
        documents = "${config.home.homeDirectory}/docs";
        download = "${config.home.homeDirectory}/downloads";
        music = "${config.home.homeDirectory}/music";
        pictures = "${config.home.homeDirectory}/pics";
        videos = "${config.home.homeDirectory}/vids";
        publicShare = "${config.home.homeDirectory}/docs/public";
        templates = "${config.home.homeDirectory}/docs/templates";
    };
    mimeApps = {
        enable = true;
        defaultApplications = {
            "inode/directory" = "thunar.desktop";
            "text/plain" = "nvim.desktop";
        };
    };
    desktopEntries = {
        # https://github.com/neovim/neovim/blob/master/runtime/nvim.desktop
        neovim = {
            name = "nvim";
            genericName = "Neovim";
            exec = "kitty nvim %F";
            terminal = false;
            categories = [ "Application" ];
            mimeType = [ 
                "text/english" "text/plain" "text/x-makefile" 
                "text/x-c++hdr" "text/x-c++src" "text/x-chdr" "text/x-csrc" 
                "text/x-java" "text/x-moc" "text/x-pascal" "text/x-tcl" 
                "text/x-tex" "application/x-shellscript" "text/x-c" "text/x-c++"
            ];
        };
    };
  };

  programs.git = {
    enable = true;
    userName = "nytouu";
    userEmail = "capitaine7312@gmail.com";
  };

  home.sessionVariables = {
    TERMINFO_DIRS = "${pkgs.st.terminfo.outPath}/share/terminfo";
    TERMINAL = "st";
    EDITOR = "nvim";
    BROWSER = "firefox";
    FILEBROWSER = "thunar";
    # XCURSOR_THEME = "Bibata-Original-Ice";
    # QT_QPA_PLATFORMTHEME = "qt5ct";
    JAVA_AWT_WM_NONPARENTING = "1";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/scripts"
  ];

  # home.activation = {
  #     installConfig = ''
  # #     if [ ! -d "${config.home.homeDirectory}/.config/nvim" ]; then
  # #         ${pkgs.git}/bin/git clone --depth 1 https://github.com/nytouu/nvim ${config.home.homeDirectory}/.config/nvim
  # #     fi
  # #
  # #     if [ ! -d "${config.home.homeDirectory}/.config/awesome" ]; then
  # #         ${pkgs.git}/bin/git clone --depth 1 --branch bloatedwm https://github.com/chadcat7/crystal ${config.home.homeDirectory}/.config/awesome
  # #     fi
  # #     '';
  # };

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
