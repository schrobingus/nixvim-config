{ pkgs, ... }:
let
  mkLua = lua: ''
    lua << EOF
    ${lua}
    EOF
  '';
in
  {
  config.extraPlugins = [
    { # Tinted Theming colorschemes for Vim.
      plugin = pkgs.vimUtils.buildVimPlugin {
        name = "tinted-vim";
        src = pkgs.fetchFromGitHub {
          owner = "tinted-theming";
          repo = "tinted-vim";
          rev = "577fe8125d74ff456cf942c733a85d769afe58b7";
          hash = "sha256-e0bpPySdJf0F68Ndanwm+KWHgQiZ0s7liLhvJSWDNsA=";
        };
      };
    }
    { # Automatic light and dark theming for supported systems.
      plugin = pkgs.vimUtils.buildVimPlugin {
        name = "auto-dark-mode";
        src = pkgs.fetchFromGitHub {
          owner = "f-person";
          repo = "auto-dark-mode.nvim";
          rev = "02ef9553e2a1d6e861bc6955d58ce5883d28a6ad";
          hash = "sha256-FTXakglUrqifEXjzES6M4L+rthItu5rlw6QyIOLYNOc=";
        };
      };
      config = mkLua /*lua*/ ''
      require('auto-dark-mode').setup({
        update_interval = 1000,
        set_dark_mode = function()
          vim.api.nvim_set_option_value('background', 'dark', {})
          vim.cmd('colorscheme base16-tomorrow-night')
        end,
        set_light_mode = function()
          vim.api.nvim_set_option_value('background', 'light', {})
          vim.cmd('colorscheme base16-tomorrow')
        end
      })
      '';
    }
  ];

  config.colorscheme = "base16-tomorrow-night"; # Fallback without auto-dark-mode.
}
