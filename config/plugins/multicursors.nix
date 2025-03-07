{ ... }:

{ # Allows support for multiple cursors in Vim.
  config.plugins.multicursors.enable = true;

  config.keymaps = [
    {
      mode = [ "n" "v" ];
      key = "<Leader>m";
      action = "<cmd>MCstart<cr>";
      options = { noremap = true; silent = true; };
    }
  ];
}
