{ config, lib, pkgs, ... }:

{
    programs.zsh = {

        enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        dotDir = ".config/zsh";
        history.path = "$ZDOTDIR/.zsh_history";
        defaultKeymap = "emacs";

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
          ls = "eza --icons";
          lst = "eza --tree --icons";
          lsa = "eza -a --icons";
          lsh = "eza -l --icons";
          lg = "lazygit";
          mi = "make install";
          dmi = "doas make install";
          rel = "xrdb merge $HOME/.config/x11/Xresources && kill -USR1 $(pidof st)";
          cdnix = "cd $HOME/nix";
          renix = "cd $HOME/nix && doas nixos-rebuild switch --flake ./#nixos --impure";
          rehome = "cd $HOME/nix && home-manager switch --flake ./#nytou@nixos";
        };

        initExtra = "
            setopt PROMPT_SUBST
                autoload -Uz vcs_info
                precmd_vcs_info() { vcs_info }
            precmd_functions+=( precmd_vcs_info )
                zstyle ':vcs_info:git:*' formats '%b'
                function getprompt ()
                {
                    if [[ \${vcs_info_msg_0_} == \"\" ]]; then
                        gitmsg='%b'
                    else
                        gitmsg=\"%F{yellow}󰊢  %F{green}$vcs_info_msg_0_ %b\"
                            fi
                            echo \"%(?.%B%F{green}➜ %f.%B%F{red}➜ %f) %F{cyan}%c $gitmsg%f\"
                }
            PROMPT=\"\\$(getprompt)%f\"  ";
    };
    # programs.eza = {
    #     enable = true;
    #     enableAliases = true;
    #     icons = true;
    # };
}
