{ pkgs, ... }:
let
  mkLua = lua: ''
    lua << EOF
      ${lua}
    EOF
  '';
in
{ # A plugin that allows web browsers to sub in Neovim for textareas.
  config.extraPlugins = [
    {
      plugin = pkgs.vimPlugins.firenvim;

      config = mkLua /*lua*/ ''
      if vim.g.started_by_firenvim then
        vim.api.nvim_create_autocmd({'TextChanged', 'TextChangedI'}, {
          callback = function(e)
            if vim.g.timer_started == true then
              return
            end
            vim.g.timer_started = true
            vim.fn.timer_start(10000, function()
              vim.g.timer_started = false
              vim.cmd('silent write')
            end)
          end
        })
      end

      vim.g.firenvim_config = {
        localSettings = {
          [".*"] = {
            priority = 0,
            cmdline  = "neovim",
            content  = "text",
            selector = "textarea",
            takeover = "always"
          },

          -- Every backslash in the URL regular expressions must have
          -- another backslash due to the way Lua handles strings.
          ["https?:\\/\\/(?:www\\.)?google\\.com\\/.*"] = {
            priority = 1,
            takeover = "never"
          },
          ["https?:\\/\\/(?:translate\\.)?google\\.com\\/.*"] = {
            priority = 1,
            takeover = "never"
          },
          ["https?:\\/\\/(?:www\\.)?discord\\.com\\/.*"] = {
            priority = 1,
            takeover = "never"
          },
          ["https?:\\/\\/(?:www\\.)?chatgpt\\.com\\/.*"] = {
            priority = 1,
            takeover = "never"
          },
          ["https?:\\/\\/(?:www\\.)?github\\.com\\/.*\\/blob\\/.*"] = {
            priority = 1,
            takeover = "never"
          },
          ["https?:\\/\\/(?:learn\\.)?zybooks\\.com\\/.*"] = {
            priority = 1,
            takeover = "never"
          },
          ["https?:\\/\\/(?:www\\.)?desmos\\.com\\/.*"] = {
            priority = 1,
            takeover = "never"
          }
        }
      }
      '';
    }
  ];
}
