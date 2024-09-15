{ pkgs, ... }:

{
  services.dunst = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
      size = "16x16";
    };
    settings = {
      global = {
        width = 500;
        height = 100;
        offset = "40x40";
        origin = "bottom-right";
        transparency = 0;
        frame_width = 1;
        frame_color = "#525252";
        padding = 12;
        horizontal_padding = 12;
        font = "Torus Pro Regular 12";
        format = "<b>%a</b>\\n%s\\n%b";
        alignment = "center";
        ellipsize = "end";
        shrink = "1";
        icon_position = "left";
        title = "Dunst";
        class = "Dunst";
        corner_radius = 12;
      };
      urgency_low = {
        background = "#1D1D1D";
        foreground = "#FFFFFF";
        timeout = 10;
      };
      urgency_normal = {
        background = "#1D1D1D";
        foreground = "#FFFFFF";
        timeout = 10;
      };
      urgency_critical = {
        background = "#1D1D1D";
        foreground = "#FFFFFF";
        frame_color = "#ffab91";
        timeout = 0;
      };
    };
  };
}
