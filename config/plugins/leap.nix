{ pkgs, ... }:
let
  mkLua = lua: ''
    lua << EOF
      ${lua}
    EOF
  '';
in
{
  config.extraPlugins = [
    { # Jumps to a char pair quickly. Similar to Snipe, Sneak, Seek, etc.
      plugin = pkgs.vimPlugins.leap-nvim;
      config = mkLua "require('leap').create_default_mappings()";
    }
  ];
}
