
# Nixvim File Tree

## Variant 1

- `default.nix`

- `globals.nix` (1 line)

- `extraPlugins.nix` (60 lines)

- `plugins.nix` (317 lines)

- `opts.nix` (37 lines)

- `extraConfigLua.nix` (115 lines)

- `colorscheme.nix` (1 line)

- `clipboard.nix` (5 lines)

- `keymaps.nix` (220 lines)

## Variant 2

- `default.nix`

  - Contents include globals, color scheme, opts, and clipboard. (44 lines)

- `plugins.nix` (377 lines)

- `extraConfigLua.nix` (115 lines)

- `keymaps.nix` (220 lines)

## Variant 3

- `default.nix`

  - Contents include globals, standard keymaps, opts, and clipboard.

- `plugins/`

- `extraConfig.nix`

