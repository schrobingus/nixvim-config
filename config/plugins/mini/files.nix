{ ... }:

{ # File navigation tool under Mini.
  config = {
    plugins.mini.modules.files = {
      options = {
        permanent_delete = true;
        use_as_default_explorer = true;
      };
      windows = {
        # max_number = 3;
        preview = true;
        width_focus = 25;
        width_nofocus = 15;
        width_preview = 50;
      };
      mappings = {
        close = "q";
        go_in = "l";
        go_in_plus = "L";
        go_out = "h";
        go_out_plus = "H";
        mark_goto = "'";
        mark_set = "m";
        reset = "<BS>";
        reveal_cwd = "@";
        show_help = "g?";
        synchronize = "=";
        trim_left = "<";
        trim_right = ">";
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "<Leader>v";
        action = "<cmd>lua MiniFiles.open()<cr>";
        options = { noremap = true; silent = true; };
      }
    ];
  };
}
