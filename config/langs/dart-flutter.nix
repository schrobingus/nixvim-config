{ pkgs, ... }:
let
  mkLua = lua: ''
    lua << EOF
      ${lua}
    EOF
  '';
in
{ # Tools for Dart and Flutter.
  config.extraPlugins = [
    {
      plugin = pkgs.vimPlugins.flutter-tools-nvim;
      config = mkLua "require('flutter-tools').setup()";
    }
  ];

  config.plugins = {
    treesitter.grammarPackages = [ pkgs.tree-sitter-grammars.tree-sitter-dart ];
    lsp.servers.dartls.enable = true;
  };
}
