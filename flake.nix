{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-f2k.url = "github:moni-dz/nixpkgs-f2k";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    # home-manager.inputs.nixpkgs.follows = "nixpkgs";

		# gaming
		nix-gaming.url = "github:fufexan/nix-gaming";

		sf-mono-liga-src = {
			url = "github:shaunsingh/SFMono-Nerd-Font-Ligaturized";
			flake = false;
		};

    # doom
    # nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";

    # hypr
		# hyprland.url = "github:hyprwm/Hyprland";
		# hyprland-plugins.url = "github:hyprwm/hyprland-plugins";
  };

  outputs = { 
    nixpkgs,
    home-manager,
    # hyprland, 
    ... 
  } @inputs: {
    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs; }; # Pass flake inputs to our config
        # > Our main nixos configuration file <
        modules = [ ./nixos/configuration.nix ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
      "nytou@nixos" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config
        # > Our main home-manager configuration file <
        modules = [
            # hyprland.homeManagerModules.default
            # { wayland.windowManager.hyprland.enable = true; }
	        ./home-manager/home.nix 
	      ];
      };
    };
  };
}
