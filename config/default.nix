{ inputs, pkgs, ... }: 
let
  mkLuaFile = file: ''
    lua << EOF
      dofile("${file}")
    EOF
  '';
  mkLua = lua: ''
    lua << EOF
      ${lua}
    EOF
  '';
in
{
  config = {
    globals.mapleader = " ";

    # NOTE: extraConfigLua, extraConfigLuaPre and extraConfigLuaPost are both valid options.

    extraPlugins = with pkgs.vimPlugins; [
      jellybeans-vim  # Jellybeans theme. # TODO: switch to base16

      true-zen-nvim # "Zen mode" for Vim, hides surrounding content for focus.
      vim-nix # Nix functionality and integration.

      vim-table-mode  # Allows one to make Markdown formatted tables with ease.

      firenvim # Embeds Neovim within web browser text areas.

      vim-pandoc  # Pandoc integration.
      vim-pandoc-syntax # Ditto, but extending to syntax.
      nabla-nvim  # TeX inline displays for plain text.
    ] ++ [
        { # Integration for the ZK plain text notes tool.
          plugin = pkgs.vimPlugins.zk-nvim;
          config = mkLua ''
          require('zk').setup()
          '';
        }

        { # Jumps to a char pair quickly. Similar to Snipe, Sneak, Seek, etc.
          plugin = pkgs.vimPlugins.leap-nvim;
          config = mkLua ''
          require('leap').create_default_mappings()
          '';
        }

        { # Tools for Dart and Flutter.
          plugin = pkgs.vimPlugins.flutter-tools-nvim;
          config = mkLua ''
          require("flutter-tools").setup {}
          '';
        }

        {
          plugin = pkgs.vimUtils.buildVimPlugin {
            name = "tinted-vim";
            src = pkgs.fetchFromGitHub {
              owner = "tinted-theming";
              repo = "tinted-vim";
              rev = "577fe8125d74ff456cf942c733a85d769afe58b7";
              hash = "sha256-e0bpPySdJf0F68Ndanwm+KWHgQiZ0s7liLhvJSWDNsA=";
            };
          };
        }
      ];

    plugins = {
      # Treesitter parsing for Neovim.
      treesitter = {
        enable = true;

        nixGrammars = true;
        grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars
          ++ (with pkgs.tree-sitter-grammars; [
            tree-sitter-norg 
            # tree-sitter-typst
          ]);
        settings = {
          ensure_installed = "all";
          indent.enable = true;
          highlight.enable = true;
        };
        nixvimInjections = true;
      };

      # Language Server Protocol for Neovim.
      lsp = {
        enable = true; 

        keymaps = {
          silent = true;

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
          };
        };

        servers = {
          nil-ls.enable = true;                 # Nix
          lua-ls.enable = true;                 # Lua

          # bashls.enable = true;               # Bash
          clojure-lsp.enable = false;           # Clojure
          omnisharp.enable = false;             # C#
          cssls.enable = false;                 # CSS
          dartls.enable = true;                 # Dart
          denols.enable = false;                # Deno
          gdscript.enable = false;              # GDScript
          html.enable = false;                  # HTML
          java-language-server.enable = false;  # Java
          jsonls.enable = true;                 # JSON
          julials.enable = false;               # Julia
          nimls.enable = false;                 # Nim
          pylsp.enable = true;                  # Python
          r-language-server.enable = false;     # R
          ruby-lsp.enable = false;              # Ruby
          # rust-analyzer.enable = false;       # Rust
          sourcekit.enable = false;             # Swift, C, C++, Obj-C, etc
          texlab.enable = true;                 # TeX, LaTeX
          tinymist.enable = true;               # Typst
          ts-ls.enable = false;                 # TypeScript
          vala-ls.enable = false;               # Vala
          # zls.enable = false;                 # Zig
        };
      };

      cmp = {
        enable = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
            { name = "luasnip"; }
          ];
          mapping = {
            "<CR>" = ''
              cmp.mapping.confirm({
                select = false,
                behavior = cmp.ConfirmBehavior.Replace
              })
            '';
            "<Tab>" = ''
              cmp.mapping(cmp.mapping.select_next_item({
                behavior = cmp.SelectBehavior.Select
              }), {"i", "s"})
            '';
            "<S-Tab>" = ''
              cmp.mapping(cmp.mapping.select_prev_item({
                behavior = cmp.SelectBehavior.Select
              }), {"i", "s"})
            '';

            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
          };
          snippet.expand = ''
            function(args) 
              require('luasnip').lsp_expand(args.body) 
            end
          '';
        };
      };

      # Configure plugins for LaTeX.
      vimtex = {
        enable = true;
        texlivePackage = null;  # NOTE: Provide Tex from home-manager or elsewhere.
        settings = {
          view_method = "skim"; # TODO: adjust for platform, skim is mac only
        };
      };

      # Configure plugins for Typst, including Tinymist for LSP.
      /* NOTE: `typst-vim` actually handles most of the document highlighting.
                Tinymist handles more of the functional areas. */
      typst-vim = {
        enable = true;
        settings.conceal_math = 1;
      };
      lsp.servers.tinymist.settings = {
        formatterMode = "typstyle";
        exportPdf = "onType";
        outputPath = "$root/$name";
      };

      luasnip = {
        enable = true;
        settings = {
          enable_autosnippets = true;
          store_selection_keys = "<Tab>";
        };
        fromSnipmate = [{
          lazyLoad = true;
          paths = ["~/.config/snippets"];
        }];
      };

      mini.enable = true; # Library of lightweight useful plugins, configured below.

      # Simple statusline for Neovim.
      mini.modules.statusline = {
        use_icons = true;  # NOTE: might want to take a look at the icons module
        set_vim_settings = false;
      }; 

      mini.modules.icons = {}; # Provides icons for mini.nvim.
      mini.mockDevIcons = true; # Extends icons from the above module to other plugins.

      # Adds easy per line commenting, either individually or via VISUAL.
      mini.modules.comment = {
        mappings = {
          comment = "gc";
          comment_line = "gcc";
          comment_visual = "gc";
          textobject = "gc";
        };
      };

      mini.modules.pairs = {};  # Automatically pairs delimiters.
      mini.modules.surround = {}; # Rapid delimiter navigation.

      # Previews referenced colors within the editor.
      nvim-colorizer = {
        enable = true;
        userDefaultOptions = {
          RGB      = true;
          RRGGBB   = true;
          RRGGBBAA = true;
          css_fn   = true;
          names    = false;
        };
      };

      smart-splits = {
        enable = true;
        settings = {
          ignored_events = [
            "BufEnter"
            "WinEnter"
          ];
          silent = true;
        };
      };

      # All of these are configured in extraConfigLua or do not need further configuration.
      fzf-lua.enable = true;  # FZF for Neovim, fills in the role of a fuzzy finder.
      gitsigns.enable = true; # Adds git signs to the gutter.
      indent-blankline.enable = true; # Whitespace / indent guides.
      multicursors.enable = true; # Functionality for multiple cursors at once.
      rainbow-delimiters.enable = false; # Distinguishes delimiter pairs with colors.
      trouble.enable = true;  # A diagnostics and quickfix list.
    };

    opts = {
      encoding = "utf-8";
      number = true;
      cursorline = true;
      wrap = true;
      linebreak = true;
      breakindent = false;
      breakindentopt = "sbr,list:-1";
      list = false;
      conceallevel = 2;
      ruler = true;
      showcmd = true;
      showmode = true;
      hlsearch = true;
      ignorecase = true;
      smartcase = true;
      cmdheight = 0;
      foldcolumn = "0"; # TODO: actually configure the fold column and actually make it usable please, thank :^)
      foldlevel = 99;
      foldlevelstart = -1;
      foldmethod = "expr";
      foldexpr = "nvim_treesitter#foldexpr()";
      foldenable = true;
      termguicolors = true;
      expandtab = true;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      autoindent = true;
      cindent = true;
      smartindent = true;
      smarttab = true;
      laststatus = 3;
      scrolloff = 6;
      backspace = "indent,eol,start";
      guifont = "SF Mono:h15";
    };

    extraConfigLua = /* lua */ ''
      local plain_text_types = { "text", "markdown", "pandoc", "tex", "typst" }

      vim.api.nvim_create_augroup("PlainTextSettings", { clear = true })

      vim.api.nvim_create_autocmd("FileType", {
        group = "PlainTextSettings",
        pattern = plain_text_types,
        callback = function()
          vim.opt.breakindent = true
          vim.opt.cursorline = false
          vim.opt.foldcolumn = "0"
          vim.opt.number = false
          vim.cmd("IBLDisable")
        end,
      })

      require("ibl").setup {
        indent = { char = "▏" },
        scope = {
          enabled = false,
          show_start = true,
          show_end = true,
        } 
      }
      
      require("fzf-lua").register_ui_select()

      if vim.g.started_by_firenvim then
        vim.api.nvim_create_autocmd({'TextChanged', 'TextChangedI'}, {
          callback = function(e)
            if vim.g.timer_started == true then
              return
            end
            vim.g.timer_started = true
            vim.fn.timer_start(10000, function()
              vim.g.timer_started = false
              vim.cmd('silent write')
            end)
          end
        })
      end

      vim.g.firenvim_config = {
        localSettings = {
          [".*"] = {
            priority = 0,
            cmdline  = "neovim",
            content  = "text",
            selector = "textarea",
            takeover = "always"
          },

          -- Every backslash in the URL regular expressions must have
          -- another backslash due to the way Lua handles strings.
          ["https?:\\/\\/(?:www\\.)?google\\.com\\/.*"] = {
            priority = 1,
            takeover = "never"
          },
          ["https?:\\/\\/(?:translate\\.)?google\\.com\\/.*"] = {
            priority = 1,
            takeover = "never"
          },
          ["https?:\\/\\/(?:www\\.)?discord\\.com\\/.*"] = {
            priority = 1,
            takeover = "never"
          },
          ["https?:\\/\\/(?:www\\.)?chatgpt\\.com\\/.*"] = {
            priority = 1,
            takeover = "never"
          },
          ["https?:\\/\\/(?:www\\.)?github\\.com\\/.*\\/blob\\/.*"] = {
            priority = 1,
            takeover = "never"
          },
          ["https?:\\/\\/(?:learn\\.)?zybooks\\.com\\/.*"] = {
            priority = 1,
            takeover = "never"
          },
          ["https?:\\/\\/(?:www\\.)?desmos\\.com\\/.*"] = {
            priority = 1,
            takeover = "never"
          }
        }
      }

      vim.cmd("highlight clear SignColumn")

      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
          local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
          for _, type in ipairs(plain_text_types) do
            if filetype == type then
              return false
            end
          end

          vim.keymap.set('n', '[c', require('gitsigns').prev_hunk, { buffer = bufnr })
          vim.keymap.set('n', ']c', require('gitsigns').next_hunk, { buffer = bufnr })
        end,
      }
    '';

    colorscheme = "base16-tomorrow-night"; # TODO: change to base16

    clipboard = {
      register = "unnamedplus";

      # providers.wl-copy.enable = true;
    };

    # TODO: add descriptions for each keymap
    keymaps = [
      # Activate the command line without <Shift>, therefore using `;`.
      {
        mode = [ "n" "x" ];
        key = ";";
        action = ":";
      }

      # Navigate via the visual line rather than the logical line by default.
      {
        mode = [ "n" "x" ];
        key = "j";
        action = "gj";
      }
      {
        mode = [ "n" "x" ];
        key = "k";
        action = "gk";
      }

      # Switch back to NORMAL from INSERT using `jj`.
      {
        mode = "i";
        key = "jj";
        action = "<Esc>";
      }

      # Enact the black hole register for deleting.
      {
        mode = [ "n" "x" ];
        key = "d";
        action = ''"_d'';
      }

      # Add blank line below or above in NORMAL mode.
      {
        mode = "n";
        key = "<Leader>o";
        action = "o<Esc>k";
        options = { noremap = true; silent = true; };
      }
      {
        mode = "n";
        key = "<Leader>O";
        action = "O<Esc>k";
        options = { noremap = true; silent = true; };
      }

      # Window switching in NORMAL mode.
      {
        mode = "n";
        key = "<C-h>";
        # action = "<C-w>h";
        action = "<cmd>lua require('smart-splits').move_cursor_left()<CR>";
        options = { noremap = true; silent = true; };
      }
      {
        mode = "n";
        key = "<C-j>";
        # action = "<C-w>j";
        action = "<cmd>lua require('smart-splits').move_cursor_down()<CR>";
        options = { noremap = true; silent = true; };
      }
      {
        mode = "n";
        key = "<C-k>";
        # action = "<C-w>k";
        action = "<cmd>lua require('smart-splits').move_cursor_up()<CR>";
        options = { noremap = true; silent = true; };
      }
      {
        mode = "n";
        key = "<C-l>";
        # action = "<C-w>l";
        action = "<cmd>lua require('smart-splits').move_cursor_right()<CR>";
        options = { noremap = true; silent = true; };
      }

      # Window resizing in NORMAL mode.
      {
        mode = "n";
        key = "<A-h>";
        action = "<cmd>lua require('smart-splits').resize_left()<CR>";
        options = { noremap = true; silent = true; };
      }
      {
        mode = "n";
        key = "<A-j>";
        action = "<cmd>lua require('smart-splits').resize_down()<CR>";
        options = { noremap = true; silent = true; };
      }
      {
        mode = "n";
        key = "<A-k>";
        action = "<cmd>lua require('smart-splits').resize_up()<CR>";
        options = { noremap = true; silent = true; };
      }
      {
        mode = "n";
        key = "<A-l>";
        action = "<cmd>lua require('smart-splits').resize_right()<CR>";
        options = { noremap = true; silent = true; };
      }

      # Cursor movement in INSERT mode.
      {
        mode = "i";
        key = "<C-h>";
        action = "<Left>";
        options = { noremap = true; silent = true; };
      }
      {
        mode = "i";
        key = "<C-j>";
        action = "<Down>";
        options = { noremap = true; silent = true; };
      }
      {
        mode = "i";
        key = "<C-k>";
        action = "<Up>";
        options = { noremap = true; silent = true; };
      }
      {
        mode = "i";
        key = "<C-l>";
        action = "<Right>";
        options = { noremap = true; silent = true; };
      }

      # Bindings for multicursors.
      {
        mode = [ "n" "v" ];
        key = "<Leader>m";
        action = "<cmd>MCstart<cr>";
        options = { noremap = true; silent = true; };
      }

      # Bindings for trouble.
      {
        mode = "n";
        key = "<Leader>xx";
        action = "<cmd>Trouble diagnostics toggle<cr>";
        options = { noremap = true; silent = true; };
      }
      {
        mode = "n";
        key = "<Leader>xX";
        action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
        options = { noremap = true; silent = true; };
      }
      {
        mode = "n";
        key = "<Leader>cs";
        action = "<cmd>Trouble symbols toggle focus=false<cr>";
        options = { noremap = true; silent = true; };
      }
      {
        mode = "n";
        key = "<Leader>cl";
        action = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>";
        options = { noremap = true; silent = true; };
      }
      {
        mode = "n";
        key = "<Leader>xL";
        action = "<cmd>Trouble loclist toggle<cr>";
        options = { noremap = true; silent = true; };
      }
      {
        mode = "n";
        key = "<Leader>xQ";
        action = "<cmd>Trouble qflist toggle<cr>";
        options = { noremap = true; silent = true; };
      }

      # Bindings for nabla.nvim.
      {
        mode = "n";
        key = "<Leader>p";
        action = "<CMD>lua require('nabla').popup()<CR>";
        options = { noremap = true; silent = true; };
      }
    ];
  };
}
