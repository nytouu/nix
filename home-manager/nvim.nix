{ pkgs, inputs, ...}:
let 
		pkgs-unstable = import inputs.unstable { system = "x86_64-linux"; config.allowUnfree = true; };
in
{
  programs.neovim = {
    enable = true;
    package = pkgs-unstable.neovim-unwrapped;
  };
}
