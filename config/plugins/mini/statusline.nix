{ ... }:

{ # Simple statusline for Neovim.
  config.plugins.mini.modules.statusline = {
    use_icons = true;  # NOTE: Might want to take a look at the icons module.
    set_vim_settings = false;
  };
}
