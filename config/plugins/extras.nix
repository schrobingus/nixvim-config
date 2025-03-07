{ pkgs, ... }:

{ # This is where the mostly unconfigured extras go.
  extraPlugins = with pkgs.vimPlugins; [
    true-zen-nvim
    vim-nix 
    vim-table-mode  
  ];
}
