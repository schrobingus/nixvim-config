{ ... }:

{ # Shows and displays diff hunks. Not to be confused with the Mini Git module.
  config.plugins.mini.modules.diff = {
    view.signs = {
      add = "│";
      change = "│";
      delete = "_";
    };
    delay.text_change = 100;
    mappings = {
      apply = "gh";
      reset = "gH";
      textobject = "gh";
      goto_first = "[H";
      goto_prev = "[h";
      goto_next = "]h";
      goto_last = "]H";
    };
  };
}
