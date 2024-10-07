{ pkgs, inputs, ... }:
let
  pkgs-unstable = import inputs.unstable { system = "x86_64-linux"; config.allowUnfree = true; };
in
{
	home.packages = with pkgs; [
		neovide
	];

  programs.neovim = {
    enable = true;
    package = pkgs-unstable.neovim-unwrapped;
    extraPackages = with pkgs-unstable; [
      rustc
      cargo
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

      nixfmt-classic
      nil

      rust-analyzer
      rustfmt
      stylua
      lua-language-server
      lua51Packages.lua
      llvmPackages.libclang

      nodePackages.bash-language-server

      csharp-ls
    ];
  };
}
