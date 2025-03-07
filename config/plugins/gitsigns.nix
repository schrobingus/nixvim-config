{ ... }:

{ # Displays gutter signs for the Git status of the buffer.
  config.plugins.gitsigns.enable = true;

  config.extraConfigLua = /*lua*/ ''
  require('gitsigns').setup {
    signs = {
      add          = { text = '│' },
      change       = { text = '│' },
      delete       = { text = '_' },
      topdelete    = { text = '‾' },
      changedelete = { text = '~' },
      untracked    = { text = '┆' },
    },
    on_attach = function(bufnr)
      local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
      for _, type in ipairs(vim.g.plain_text_types) do
        if filetype == type then
          return false
        end
      end

      vim.keymap.set('n', '[c', require('gitsigns').prev_hunk, { buffer = bufnr })
      vim.keymap.set('n', ']c', require('gitsigns').next_hunk, { buffer = bufnr })
    end,
  }
  '';
}
