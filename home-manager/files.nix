{ ... }:

{
  home = {
    file = {
      ".config/htop".source = ./config/htop;
      ".config/lazygit".source = ./config/lazygit;
      ".config/fontconfig".source = ./config/fontconfig;

      ".config/picom.conf".source = ./config/picom.conf;
      # ".config/rofi".source = ./config/rofi;
    };
  };
}
