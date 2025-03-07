{ pkgs, ... }:

{ # Typst functionality for Vim.
  # NOTE: `typst-vim` actually handles most of the document highlighting, Tinymist handles more of the functional areas.
  config.plugins.typst-vim = {
    enable = true;
    settings.conceal_math = 0;  # Again, this is best to be disabled with Nabla enabled.
  };

  # config.plugins.treesitter.grammarPackages = [ pkgs.tree-sitter-packages.tree-sitter-typst ];
  config.plugins.lsp.servers.tinymist = {
    enable = true;
    settings = {
      formatterMode = "typstyle";
      exportPdf = "onType";
      outputPath = "$root/$name";
    };
  };
}
