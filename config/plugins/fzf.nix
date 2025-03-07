{ ... }:

{ # FZF for Neovim, fills in the role of a fuzzy finder.
  config.plugins.fzf-lua.enable = true;

  config.extraConfigLua = /*lua*/ ''
  require("fzf-lua").register_ui_select()
  '';

}
