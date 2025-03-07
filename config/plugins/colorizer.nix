{ ... }:

{
  config.plugins.nvim-colorizer = {
    enable = true;
    userDefaultOptions = {
      RGB      = true;
      RRGGBB   = true;
      RRGGBBAA = true;
      css_fn   = true;
      names    = false;
    };
  };
}
