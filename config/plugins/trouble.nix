{ ... }:

{ # Displays errors and warnings in the current buffer and project.
  config.plugins.trouble.enable = true;

  config.keymaps = [
    {
      mode = "n";
      key = "<Leader>xx";
      action = "<cmd>Trouble diagnostics toggle<cr>";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "n";
      key = "<Leader>xX";
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "n";
      key = "<Leader>cs";
      action = "<cmd>Trouble symbols toggle focus=false<cr>";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "n";
      key = "<Leader>cl";
      action = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "n";
      key = "<Leader>xL";
      action = "<cmd>Trouble loclist toggle<cr>";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "n";
      key = "<Leader>xQ";
      action = "<cmd>Trouble qflist toggle<cr>";
      options = { noremap = true; silent = true; };
    }
  ];
}
