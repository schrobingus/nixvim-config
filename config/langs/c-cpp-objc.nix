{ pkgs, ... }:

{ # Language configuration for C, C++, CMake, and Objective-C.

  config.plugins.treesitter.grammarPackages = with pkgs.tree-sitter-grammars; [
    tree-sitter-c
    tree-sitter-cpp

    tree-sitter-cmake
  ];

  config.plugins.lsp.servers = {
    clangd.enable = true;
    sourcekit.enable = true; # Also supports Swift.
  };
}
