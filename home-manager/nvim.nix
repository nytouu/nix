{ pkgs, ...}:
{
	programs.neovim = {
        enable = false;
        package = pkgs.neovim-nightly;
        defaultEditor = true;
        plugins = [
            pkgs.vimPlugins.nvim-treesitter.withAllGrammars
        ];
		extraLuaPackages = ps: [
			ps.magick
		];
        extraPackages = with pkgs; [
			tree-sitter
			# ueberzugpp
			# nodePackages_latest.browser-sync

            nixfmt
			nil

			rust-analyzer
			rustfmt

			lua stylua lua-language-server
			llvmPackages_9.libclang

			omnisharp-roslyn
        ];
    };
}
