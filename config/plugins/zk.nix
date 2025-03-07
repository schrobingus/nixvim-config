{ pkgs, ... }:
let
  mkLua = lua: ''
    lua << EOF
      ${lua}
    EOF
  '';
in
{ # Integration for the ZK plain text notes tool.
  config.extraPlugins = [
    {       
      plugin = pkgs.vimPlugins.zk-nvim;
      config = mkLua "require('zk').setup()";
    }
  ];
}
