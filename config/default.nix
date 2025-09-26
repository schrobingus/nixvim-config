{ ... }:

# TODO: integrate multicursors into your workflow
# FIXME: markdown conceal that doesn't completely obstruct the view
# TODO: configure foldcolumn
# TODO: try this tabline https://github.com/iofq/dart.nvim

{
  imports = [
    ./extra-config.nix

    ./langs/extra-support.nix

    ./plugins/mini/default.nix # Mini module options configured there.

    ./langs/c-cpp-objc.nix
    ./langs/dart-flutter.nix
    ./langs/harper.nix
    ./langs/markdown.nix
    ./langs/tex.nix
    ./langs/typst.nix

    ./plugins/cmp.nix
    ./plugins/colorizer.nix
    ./plugins/dart-tabline.nix
    ./plugins/extras.nix
    ./plugins/fzf.nix
    # ./plugins/gitsigns.nix
    # ./plugins/indent-blankline.nix
    ./plugins/leap.nix
    # ./plugins/luasnip.nix
    # ./plugins/multicursors.nix
    ./plugins/nabla.nix
    # ./plugins/nvim-tree.nix
    # ./plugins/rainbow-delimiters.nix
    # ./plugins/smart-splits.nix
    ./plugins/theming.nix
    ./plugins/ts-lsp.nix
    ./plugins/trouble.nix
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
      cmdheight = 1;
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

      # Window switching in NORMAL mode.
      # NOTE: Comment out and disable when using Smart Splits.
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options = { noremap = true; silent = true; };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options = { noremap = true; silent = true; };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options = { noremap = true; silent = true; };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options = { noremap = true; silent = true; };
      }
    ];
  };
}
