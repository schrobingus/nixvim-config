{ ... }: 

# TODO: integrate luasnip into your workflow
# TODO: integrate multicursors into your workflow
# FIXME: markdown conceal that doesn't completely obstruct the view
# TODO: configure foldcolumn

{
  imports = [
    ./extraConfig.nix

    # ./plugins/langs/dart-flutter.nix
    ./plugins/langs/markdown.nix
    ./plugins/langs/tex.nix
    ./plugins/langs/typst.nix

    ./plugins/cmp.nix
    ./plugins/colorizer.nix
    ./plugins/extras.nix
    # ./plugins/firenvim.nix
    ./plugins/fzf.nix
    ./plugins/gitsigns.nix
    ./plugins/indent-blankline.nix
    ./plugins/leap.nix
    ./plugins/lsp.nix
    # ./plugins/luasnip.nix     
    ./plugins/mini/default.nix # Mini module options configured there.
    # ./plugins/multicursors.nix  
    ./plugins/nabla.nix
    ./plugins/rainbow-delimiters.nix
    ./plugins/smart-splits.nix
    ./plugins/theming.nix
    ./plugins/treesitter.nix
    ./plugins/trouble.nix
    # ./plugins/zk.nix
  ];

  config = {
    globals.mapleader = " ";

    opts = {
      encoding = "utf-8";
      number = true;
      cursorline = true;
      wrap = true;
      linebreak = true;
      breakindent = true;
      breakindentopt = "sbr,list:-1";
      list = false;
      conceallevel = 0; 
      ruler = true;
      showcmd = true;
      showmode = true;
      hlsearch = true;
      ignorecase = true;
      smartcase = true;
      cmdheight = 0;
      foldcolumn = "0"; 
      foldlevel = 99;
      foldlevelstart = -1;
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
      guifont = "Geist Mono:h15";
    };

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
        key = "jk";
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
    ];
  };
}
