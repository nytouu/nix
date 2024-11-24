{ inputs, pkgs, ... }:
let
  pkgs-unstable = import inputs.unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
		overlays = [ inputs.fenix.overlays.default ];
  };
in
{
  home.packages = with pkgs; [
    neovide
  ];

  programs.neovim = {
    enable = true;
    package = pkgs-unstable.neovim-unwrapped;
    extraPackages = with pkgs-unstable; [
			(fenix.complete.withComponents [
				"cargo"
				"clippy"
				"rust-src"
				"rustc"
				"rustfmt"
			])
			rust-analyzer-nightly

      meson
      ninja
      nodejs
      gnumake
      cmake
      luarocks
      python3
      gcc
      go
      dotnetCorePackages.sdk_8_0
      tree-sitter

      nixfmt-rfc-style
      nixd

      stylua
      lua-language-server
      lua51Packages.lua
      llvmPackages.libclang

      nodePackages.bash-language-server

      csharp-ls
			# omnisharp-roslyn

			gdtoolkit_4
    ];
  };
}
