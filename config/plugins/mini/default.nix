{ ... }:

{ # Library of lightweight and useful plugins, configured within all confined in this directory.
  config.plugins.mini.enable = true;

  imports = [
    ./clue.nix
    ./comment.nix
    ./diff.nix
    ./files.nix
    ./git.nix
    ./icons.nix
    ./indentscope.nix
    ./notify.nix
    ./pairs.nix
    ./statusline.nix
    # ./surround.nix
    ./tabline.nix
    ./trailspace.nix
  ];
}
