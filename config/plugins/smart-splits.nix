{ ... }:

{ # Unifies Neovim splits with those with other functionality, such as Tmux and Wezterm.
  config.plugins.smart-splits = {
    enable = true;
    settings = {
      ignored_events = [
        "BufEnter"
        "WinEnter"
      ];
      silent = true;
    };
  };

  config.keymaps = [
    # Window switching in NORMAL mode.
    {
      mode = "n";
      key = "<C-h>";
      action = "<cmd>lua require('smart-splits').move_cursor_left()<CR>";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<cmd>lua require('smart-splits').move_cursor_down()<CR>";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<cmd>lua require('smart-splits').move_cursor_up()<CR>";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<cmd>lua require('smart-splits').move_cursor_right()<CR>";
      options = { noremap = true; silent = true; };
    }

    # Window resizing in NORMAL mode.
    {
      mode = "n";
      key = "<A-h>";
      action = "<cmd>lua require('smart-splits').resize_left()<CR>";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "n";
      key = "<A-j>";
      action = "<cmd>lua require('smart-splits').resize_down()<CR>";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "n";
      key = "<A-k>";
      action = "<cmd>lua require('smart-splits').resize_up()<CR>";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "n";
      key = "<A-l>";
      action = "<cmd>lua require('smart-splits').resize_right()<CR>";
      options = { noremap = true; silent = true; };
    }
  ];
}
