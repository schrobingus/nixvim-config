{ pkgs, ... }:

{
  config.plugins.vimtex = { # TeX integration for Vim.
    # NOTE: When using Nabla, it is best not to conceal math at all.
    enable = true;
    texlivePackage = null;  # NOTE: Provide Tex from home-manager or elsewhere.
    settings = {
      view_method = "skim"; # TODO: adjust for platform, skim is mac only
    };
  };

  # config.plugins.treesitter.grammarPackages = [ 
  #   pkgs.tree-sitter-grammars.tree-sitter-latex 
  #   pkgs.tree-sitter-grammars.tree-sitter-bibtex
  # ];

  config.plugins.lsp.servers.texlab.enable = true;
}
