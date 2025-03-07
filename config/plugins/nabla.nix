{ pkgs, ... }:

{
  # Nabla provides a small text preview for TeX expressions.
  config.extraPlugins = [ pkgs.vimPlugins.nabla-nvim ];

  config.keymaps = [
    {
      mode = "n";
      key = "<Leader>p";
      action = "<CMD>lua require('nabla').popup()<CR>";
      options = { noremap = true; silent = true; };
    }
    {
      mode = "n";
      key = "<Leader>P";
      action = "<CMD>lua require('nabla').toggle_virt({ autogen = true, silent = true })<CR>";
      options = { noremap = true; silent = true; };
    }
  ];
}
