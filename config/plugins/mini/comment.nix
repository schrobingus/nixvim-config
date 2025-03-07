{ ... }:

{ # Provides commenting bindings in Neovim.
  config.plugins.mini.modules.comment = {
    mappings = {
      comment = "gc";
      comment_line = "gcc";
      comment_visual = "gc";
      textobject = "gc";
    };
  };
}
