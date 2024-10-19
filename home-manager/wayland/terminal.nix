{ pkgs, ... }:
{
	programs.foot = {
		enable = true;
		settings = {
			main = {
				term = "xterm-256color";
				font = "MartianMono Nerd Font:size=11";
				line-height = 17;
			};

			mouse = {
				hide-when-typing = "yes";
			};

			colors = {
				alpha = 0.9;
			};
		};
	};
}
