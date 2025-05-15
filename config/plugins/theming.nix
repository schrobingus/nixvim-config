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
    { # Flexoki themes for Neovim. (slated for removal)
      plugin = pkgs.vimUtils.buildVimPlugin {
        name = "flexoki-nvim";
        src = pkgs.fetchFromGitHub {
          owner = "nuvic";
          repo = "flexoki-nvim";
          rev = "079554c242a86be5d1a95598c7c6368d6eedd7a3";
          hash = "sha256-vjjAulQVFS+OmpWzLkliqpan3GXlvatdaCnI96bjxC0=";
        };
      };
    }
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
          vim.cmd('colorscheme flexoki-moon')
        end,
        set_light_mode = function()
          vim.api.nvim_set_option_value('background', 'light', {})
          vim.cmd('colorscheme flexoki-dawn')
        end
      })
      '';
    }
  ];

  config.colorscheme = "flexoki-moon"; # Fallback without auto-dark-mode.
}
