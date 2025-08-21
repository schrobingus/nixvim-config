
{ ... }:

{ # An indent scope for Neovim that spawns on press and doesn't get in the way.
  config.plugins.mini.modules.indentscope = {
    # symbol = "╎";
    symbol = "▏";
    draw = {
      # delay = 0;
      delay = 100;
      animation.__raw = "require('mini.indentscope').gen_animation.none()";
    };
    mappings = {
      object_scope = "<Leader>ii";
      object_scope_with_border = "<Leader>ai";
      goto_top = "[i";
      goto_bottom = "]i";
    };
  };
}

