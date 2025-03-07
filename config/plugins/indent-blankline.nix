{ ... }:

{ # Provides whitespace and indent guides in the current buffer.
  config.plugins.indent-blankline.enable = true;

  config.extraConfigLua = /*lua*/ ''
  require("ibl").setup {
    indent = { char = "▏" },
    scope = {
      enabled = false,
      show_start = true,
      show_end = true,
    } 
  }
  '';
}
