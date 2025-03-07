{ ... }:

{
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
      nil-ls.enable = true;                 # Nix
      lua-ls.enable = true;                 # Lua

      # bashls.enable = true;               # Bash
      clojure-lsp.enable = false;           # Clojure
      omnisharp.enable = false;             # C#
      clangd.enable = true;                 # C/C++
      cssls.enable = false;                 # CSS
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
      # sourcekit.enable = false;           # Swift, C, C++, Obj-C, etc
      ts-ls.enable = false;                 # TypeScript
      vala-ls.enable = false;               # Vala
      # zls.enable = false;                 # Zig
    };
  };

  config.plugins.cmp.settings.sources = [
    { name = "nvim_lsp"; }
  ];
}
