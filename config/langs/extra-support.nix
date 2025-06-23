{ pkgs, ... }:

{ # This file is purely for extra language support in Treesitter, LSP, and whatnot.
  # If a language file is not created in `langs`, the support for the language is 
  # likely in here.

  config.plugins.treesitter.grammarPackages = with pkgs.tree-sitter-grammars; [
    tree-sitter-bash
    # tree-sitter-beancount
    # tree-sitter-bitbake
    # tree-sitter-bqn
    tree-sitter-clojure
    tree-sitter-comment
    tree-sitter-commonlisp
    tree-sitter-css
    tree-sitter-cuda
    # tree-sitter-cue
    # tree-sitter-devicetree
    tree-sitter-dockerfile
    # tree-sitter-dot
    # tree-sitter-earthfile
    # tree-sitter-eex
    tree-sitter-elisp
    tree-sitter-elixir
    tree-sitter-elm
    # tree-sitter-embedded-template
    tree-sitter-erlang
    tree-sitter-fennel
    tree-sitter-fish
    # tree-sitter-fortran
    tree-sitter-gdscript
    tree-sitter-gleam
    # tree-sitter-glimmer
    tree-sitter-glsl
    tree-sitter-go
    tree-sitter-godot-resource
    # tree-sitter-gomod
    # tree-sitter-gowork
    # tree-sitter-graphql
    tree-sitter-haskell
    # tree-sitter-hcl
    # tree-sitter-heex
    # tree-sitter-hjson
    tree-sitter-html
    tree-sitter-http
    # tree-sitter-hyprlang
    # tree-sitter-janet-simple
    tree-sitter-java
    tree-sitter-javascript
    tree-sitter-jsdoc
    tree-sitter-json
    tree-sitter-json5
    tree-sitter-jsonnet
    tree-sitter-julia
    tree-sitter-just
    # tree-sitter-koka
    tree-sitter-kotlin
    # tree-sitter-ledger
    tree-sitter-llvm
    tree-sitter-make
    # tree-sitter-nickel
    tree-sitter-norg
    tree-sitter-norg-meta
    tree-sitter-nu
    tree-sitter-ocaml
    tree-sitter-org-nvim
    tree-sitter-perl
    # tree-sitter-pgn
    tree-sitter-php
    # tree-sitter-pioasm
    # tree-sitter-prisma
    # tree-sitter-proto
    # tree-sitter-pug
    tree-sitter-python
    # tree-sitter-ql
    # tree-sitter-ql-dbscheme
    tree-sitter-query
    tree-sitter-r
    tree-sitter-regex
    # tree-sitter-rego
    # tree-sitter-river
    tree-sitter-rst
    tree-sitter-ruby
    tree-sitter-rust
    tree-sitter-scala
    tree-sitter-scheme
    tree-sitter-scss
    # tree-sitter-smithy
    # tree-sitter-solidity
    # tree-sitter-sparql
    tree-sitter-sql
    # tree-sitter-supercollider
    # tree-sitter-surface
    tree-sitter-svelte
    # tree-sitter-talon
    # tree-sitter-templ
    # tree-sitter-tiger
    # tree-sitter-tlaplus
    tree-sitter-toml
    # tree-sitter-tsq
    # tree-sitter-turtle
    # tree-sitter-twig
    tree-sitter-typescript
    # tree-sitter-uiua
    # tree-sitter-verilog
    tree-sitter-vim
    tree-sitter-vue
    # tree-sitter-wgsl
    # tree-sitter-wing
    tree-sitter-yaml
    # tree-sitter-yang
    tree-sitter-zig
  ];

  config.plugins.lsp.servers = {
    # bashls.enable = true;               # Bash
    clojure_lsp.enable = false;           # Clojure
    omnisharp.enable = false;             # C#
    cssls.enable = false;                 # CSS
    denols.enable = false;                # Deno
    gdscript.enable = false;              # GDScript
    html.enable = false;                  # HTML
    java_language_server.enable = false;  # Java
    jsonls.enable = true;                 # JSON
    julials.enable = false;               # Julia
    nimls.enable = false;                 # Nim
    pyright.enable = true;                # Python
    r_language_server.enable = false;     # R
    ruby_lsp.enable = false;              # Ruby
    # rust_analyzer.enable = false;       # Rust
    ts_ls.enable = false;                 # TypeScript
    vala_ls.enable = false;               # Vala
    # zls.enable = false;                 # Zig
  };
}
