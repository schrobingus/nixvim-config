
{ pkgs, ... }:

let
  mkLua = lua: ''
    lua << EOF
    ${lua}
    EOF
  '';
in

{ # Dart, a minimal tabline focused on easy access and manipulation of buffers.
  # This is not to be confused with the Dart language, LSP and Treesitter configurations for that are in `../langs/dart-flutter.nix`.
  # NOTE: this requires some hacky derivation stuff to configure properly. consider contributing a module to nixvim (also nixpkgs at least)?
  # NOTE: might want to consider changing the key background, since it's just the generic background
  config.extraPlugins = [
    {
      plugin = pkgs.vimUtils.buildVimPlugin {
        name = "dart";
        src = pkgs.fetchFromGitHub {
          owner = "iofq";
          repo = "dart.nvim";
          rev = "f059335a22811374d5a7e22c97889ea712db58d7";
          hash = "sha256-BBjs+YCOzgb6N2lew4vEmyS6s70y0z5xStKjGQaf55g=";
        };
      };
      config = mkLua /*lua*/ ''
        require('dart').setup({
          marklist = { 'a', 's', 'd', 'f', 'q', 'w', 'e', 'r' },
          buflist = { 'z', 'x', 'c' },

          tabline = {
            always_show = true,
            cycle_wraps_around = true,
            icons = true,
          },

          -- Some of these are also redone in `config.keymaps`, as leader bindings don't seem to work here.
          mappings = {
            next = "<S-l>",
            prev = "<S-h>",
            pick = "<leader>b",
            mark = "<leader>Bm",
            jump = "",
            unmark_all = "",
          },
        })
      '';
    }
  ];

  config.keymaps = [
    {
      mode = "n";
      key = "<leader>b";
      options.silent = true;
      action = "<CMD>lua Dart.pick()<CR>";
    }
    {
      mode = "n";
      key = "<leader>Bm";
      options.silent = true;
      action = "<CMD>lua Dart.mark()<CR>";
    }
    {
      mode = "n";
      key = "<leader>Bq";
      options.silent = true;
      action = "<CMD>bdelete<CR>";
    }
  ];
}

