{ pkgs, config, inputs, ... }:

{
	home.packages = with pkgs; [
		protonup-qt 
		# heroic-unwrapped
		prismlauncher

    winetricks
		inputs.nix-gaming.packages.${pkgs.system}.wine-osu
		inputs.nix-gaming.packages.${pkgs.system}.osu-lazer-bin
    inputs.nix-gaming.packages.${pkgs.system}.wine-discord-ipc-bridge
		# inputs.nix-gaming.packages.${pkgs.system}.rocket-league
	];
}
