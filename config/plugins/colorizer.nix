{ ... }:

{
  config.plugins.colorizer = {
    enable = true;
    settings.user_default_options = {
      RGB      = true;
      RRGGBB   = true;
      RRGGBBAA = true;
      css_fn   = true;
      names    = false;
    };
  };
}
