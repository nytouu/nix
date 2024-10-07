{ inputs, pkgs, ... }:
{
	home.packages = [
		inputs.zen-browser.packages."${pkgs.system}".specific
	];

  programs.firefox = {
    enable = false;
  };
}
