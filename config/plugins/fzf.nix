{ ... }:

{ # FZF for Neovim, fills in the role of a fuzzy finder.
  config.plugins.fzf-lua.enable = true;

  config.extraConfigLua = /*lua*/ ''
  require("fzf-lua").register_ui_select()
  '';

  config.keymaps = [
    {
      mode = "n";
      key = "<leader>f";
      options.silent = true;
      action = "<CMD>FzfLua files<CR>";
    }
    {
      mode = "n";
      key = "<leader>F";
      options.silent = true;
      action = "<CMD>FzfLua oldfiles<CR>";
    }
    {
      mode = "n";
      key = "<leader>G";
      options.silent = true;
      action = "<CMD>FzfLua git_files<CR>";
    }
    {
      mode = "n";
      key = "<leader>g";
      options.silent = true;
      action = "<CMD>FzfLua grep<CR>";
    }
    {
      mode = "n";
      key = "<leader>Bb"; # Corresponds to Dart tabline bindings.
      options.silent = true;
      action = "<CMD>FzfLua buffers<CR>";
    }
    {
      mode = "n";
      key = "<leader>tt";
      options.silent = true;
      action = "<CMD>FzfLua tabs<CR>";
    }
    # TODO: add lsp diagnostics
  ];
}
