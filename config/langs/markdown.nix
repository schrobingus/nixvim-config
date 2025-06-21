{ ... }:

{
  config.plugins.markview = { # Visualize Markdown right in the editor in a legible way.
    enable = false; # TODO: conceal links on a line basis so they don't take up space. this isn't in markview yet, open an issue or pr
    settings = {
      buf_ignore = [ "nofile" ];
      modes = [ "n" "x" ];  
      hybrid_modes = [ "i" "r" ];
    };
  };

  # config.plugins.treesitter.grammarPackages = [ pkgs.tree-sitter-grammars.tree-sitter-markdown ];
}
