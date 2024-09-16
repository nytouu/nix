{ config, pkgs, ... }:

{
  imports = [
    ./shells.nix
    # ./theme/current.nix
    ./packages.nix
    ./terminal.nix
    ./x.nix
    ./nvim.nix
    ./files.nix
    ./music.nix
    ./browser.nix
    ./games.nix
    ./git.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
      permittedInsecurePackages = [
        "electron-13.6.9"
        "electron-25.9.0"
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

  programs.java.enable = true;

  programs.gpg.enable = true;
  services.gpg-agent.enable = true;

  gtk.gtk3 = {
    bookmarks = [
      "file:///mnt/KINGSTON"
      "file:///home/nytou/docs"
      "file:///home/nytou/music"
      "file:///home/nytou/pics"
      "file:///home/nytou/vids"
      "file:///home/nytou/downloads"
      "file:///home/nytou/nix"
      "file:///home/nytou/git"
      "file:///home/nytou/code"
      "file:///mnt/KINGSTON/Cours"
    ];
  };

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
  };

  home.sessionVariables = {
    TERMINFO_DIRS = "${pkgs.st.terminfo.outPath}/share/terminfo";
    TERMINAL = "st";
    EDITOR = "nvim";
    BROWSER = "firefox";
    FILEBROWSER = "thunar";
    XCURSOR_THEME = "Notwaita-Black";
    # QT_QPA_PLATFORMTHEME = "qt5ct";
    # QT_STYLE_OVERRIDE = "kvantum";
    JAVA_AWT_WM_NONPARENTING = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.activation = {
    installConfig = ''
      if [ ! -d "${config.home.homeDirectory}/.config/nvim" ]; then
          ${pkgs.git}/bin/git clone --depth 1 https://github.com/nytouu/nvim ${config.home.homeDirectory}/.config/nvim
      fi

      if [ ! -d "${config.home.homeDirectory}/.config/awesome" ]; then
          ${pkgs.git}/bin/git clone --depth 1 https://github.com/nytouu/awm ${config.home.homeDirectory}/.config/awesome
      fi
    '';
  };

  # Enable home-manager
  programs.home-manager.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
