{ pkgs, ... }:
{

  home.packages = with pkgs; [
    github-desktop
  ];

  programs.git = {
    enable = true;
    userName = "nytouu";
    userEmail = "capitaine7312@gmail.com";
    signing = {
      signByDefault = true;
      key = "3D59B7C1AAB592E7";
    };
		extraConfig = {
			merge = {
				tool = "nvimdiff3";
			};
		};
  };

  programs.lazygit = {
		enable = true;
		settings = {
			core = {
				editor = "nvim";
			};
			os = {
				editPreset = "nvim";
			};
		};
	};
}
