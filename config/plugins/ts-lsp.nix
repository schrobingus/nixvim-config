{ pkgs, ... }:

{ # Treesitter and LSP config, provides support for Lua and Nix.
  # Language support utilizing these is in the `langs` directory.

  # Treesitter parsing for Neovim.
  config.plugins.treesitter = {
    enable = true;
    settings = {
      # ensure_installed = "all";
      indent.enable = true;
      highlight.enable = true;
    };
    nixGrammars = true;
    nixvimInjections = true;
    grammarPackages = with pkgs.tree-sitter-grammars; [
      tree-sitter-lua
      tree-sitter-nix
    ];
  };
  config.opts = {
    foldmethod = "expr";
    foldexpr = "nvim_treesitter#foldexpr()";
  };

  # Language Server Protocol for Neovim.
  config.plugins.lsp = {
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
      nil-ls.enable = true; 
      lua-ls.enable = true;
    };
  };
  config.plugins.cmp.settings.sources = [
    { name = "nvim_lsp"; }
  ];
}
