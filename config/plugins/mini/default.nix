{ ... }:

{ # Library of lightweight and useful plugins, configured within all confined in this directory.
  config.plugins.mini.enable = true;

  imports = [
    ./comment.nix
    ./icons.nix
    ./pairs.nix
    ./statusline.nix
    ./surround.nix
  ];
}
