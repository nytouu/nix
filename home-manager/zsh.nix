{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    dotDir = ".config/zsh";
    history.path = "$ZDOTDIR/.zsh_history";
    defaultKeymap = "emacs";
		enableVteIntegration = true;
		localVariables = {
		};

    plugins = [
			{
				name = "zsh-autopair";
				src = pkgs.fetchFromGitHub {
					owner = "hlissner";
					repo = "zsh-autopair";
					rev = "396c38a7468458ba29011f2ad4112e4fd35f78e6";
					sha256 = "0q9wg8jlhlz2xn08rdml6fljglqd1a2gbdp063c8b8ay24zz2w9x";
				};
			}
    ];

    shellAliases = {
      nv = "nvim";
      cdnv = "cd $HOME/.config/nvim";
      ls = "eza --icons always";
      lst = "eza --tree --icons";
      lsa = "eza -a --icons";
      lsh = "eza -l --icons";
      lg = "lazygit";
      mi = "make install";
      dmi = "doas make install";
      rel = "xrdb merge $HOME/.config/x11/Xresources && kill -USR1 $(pidof st)";
      cdnix = "cd $HOME/nix";
      cdaw = "cd $HOME/.config/awesome";
      renix = "cd $HOME/nix && doas nixos-rebuild switch --flake ./#nixos --impure";
      rehome = "cd $HOME/nix && home-manager switch --flake ./#nytou@nixos";
    };

    initExtra = ''
      export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"

      setopt PROMPT_SUBST
      autoload -Uz vcs_info
      precmd_vcs_info() { vcs_info }
      precmd_functions+=( precmd_vcs_info )
      zstyle ':vcs_info:git:*' formats '%b'
      function getprompt (){
        if [[ ''${vcs_info_msg_0_} == "" ]]; then
          gitmsg='%b'
        else
          gitmsg="%F{black}%K{black}%F{yellow}  %F{green}$vcs_info_msg_0_%F{black}%k%f%b"
        fi

        echo "%F{black}%K{black}%F{cyan} %c%F{black}%k%f $gitmsg%f\n%(?.%B%F{green}➜ %f.%B%F{red}➜ %f)"
      }
      # RPROMPT="%F{black}%K{black}%F{cyan} %c%F{black}%k"
      PROMPT="\$(getprompt)%f%k"
    '';
  };
}
