{
  pkgs,
  inputs,
  ...
}:
let
  pkgs-unstable = import inputs.unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
in
{
  home.packages = with pkgs; [
    # protonup-qt
    pkgs-unstable.prismlauncher

    # pkgs-unstable.osu-lazer-bin

    winetricks
    protontricks

    inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin

    inputs.nix-gaming.packages.${pkgs.system}.wine-osu
    inputs.nix-gaming.packages.${pkgs.system}.wine-discord-ipc-bridge
  ];
}
