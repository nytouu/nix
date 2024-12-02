{  inputs,
  pkgs,
  lib,
  ...
}:
let
  pkgs-unstable = import inputs.unstable {
    system = "x86_64-linux";
    config.allowUnfree = true;
    overlays = [ inputs.fenix.overlays.default ];
  };
in
{
  home.packages = with pkgs-unstable; [
    (fenix.complete.withComponents [
      "cargo"
      "clippy"
      "rust-src"
      "rustc"
      "rustfmt"
    ])
    rust-analyzer-nightly

    tree-sitter

    nixfmt-rfc-style
    pkgs.nixd

    csharp-ls
		pkgs.omnisharp-roslyn
    dotnetCorePackages.sdk_8_0

    stylua
    lua-language-server
    lua51Packages.lua

    nodePackages.bash-language-server
  ];

  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
			# "csharp"
      "lua"
      "toml"
      "make"
      "vscode-dark-modern"
      "zedwaita"
    ];

    # extraPackages = with pkgs-unstable; [
    # (fenix.complete.withComponents [
    # 	"cargo"
    # 	"clippy"
    # 	"rust-src"
    # 	"rustc"
    # 	"rustfmt"
    # ])
    # 	rust-analyzer-nightly
    #
    #       tree-sitter
    #
    #       nixfmt-rfc-style
    #       pkgs.nixd
    #
    #       csharp-ls
    #       dotnetCorePackages.sdk_8_0
    #
    #       stylua
    #       lua-language-server
    #       lua51Packages.lua
    #
    #       nodePackages.bash-language-server
    # ];

    # userKeymaps = [
    #   {
    #     context = "Workspace";
    #     bindings = {
    #       ctrl-shift-t = "workspace::NewTerminal";
    #     };
    #   }
    # ];

    ## everything inside of these brackets are Zed options.
    userSettings = {
      assistant = {
        enabled = true;
        version = "2";
        default_open_ai_model = null;
        default_model = {
          provider = "zed.dev";
          model = "claude-3-5-sonnet-latest";
        };
      };

      auto_signature_help = true;

      toolbar = {
        breadcrumbs = false;
        quick_actions = false;
        selections_menu = false;
      };

      scrollbar = {
        show = "never";
      };
      indent_guides = {
        line_width = 2;
        active_line_width = 2;
      };
      vertical_scroll_margin = 5;
      relative_line_numbers = true;

      inlay_hints = {
        enabled = true;
        show_type_hints = true;
        show_parameter_hints = true;
        show_other_hints = true;
        show_background = true;
        edit_debounce_ms = 400;
        scroll_debounce_ms = 5;
      };

      collaboration_panel = {
        button = false;
      };
      chat_panel = {
        button = false;
      };

      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      tab_bar = {
        show_nav_history_buttons = false;
      };

      tabs = {
        git_status = true;
        close_position = "right";
        file_icons = true;
      };

      vim = {
        toggle_relative_line_numbers = true;
        use_system_clipboard = "always";
        use_multiline_find = true;
        use_smartcase_find = true;
        custom_digraphs = { };
      };

      cursor_blink = false;

      hour_format = "hour24";
      auto_update = false;
      terminal = {
        alternate_scroll = "off";
        blinking = "on";
        copy_on_select = false;
        dock = "bottom";
        env = {
          TERM = "st";
        };
        font_family = "MartianMono Nerd Font";
        # font_features = null;
        # font_size = null;
        line_height = "comfortable";
        option_as_meta = false;
        button = false;
        shell = "system";
        toolbar = {
          title = true;
        };
        working_directory = "current_project_directory";
      };

      lsp = {
        rust-analyzer = {
          binary = {
            path = lib.getExe pkgs-unstable.rust-analyzer-nightly;
            # path_lookup = true;
          };
        };
        csharp = {
          binary = {
            path = lib.getExe pkgs.omnisharp-roslyn;
            # path_lookup = true;
          };
        };
        nix = {
          binary = {
            path = lib.getExe pkgs.nixd;
            # path_lookup = true;
          };
        };
      };

      vim_mode = true;

      base_keymap = "VSCode";
      theme = {
        mode = "system";
        light = "Zedwaita Light";
        dark = "VSCode Dark Modern";
      };
      show_whitespaces = "none";

      ui_font_size = 18;
      ui_font_family = ".SystemUIFont";

      buffer_font_family = "MartianMono Nerd Font";
      buffer_font_weight = 500;
      buffer_font_size = 14;
    };
  };
}
