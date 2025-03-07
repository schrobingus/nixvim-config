{ ... }:

{
  config.extraConfigLuaPre = /*lua*/ ''
  vim.g.plain_text_types = { "text", "markdown", "rmd", "tex", "typst" }

  vim.cmd("highlight clear SignColumn")
  '';

  config.extraConfigLua = /*lua*/ ''
  -- TODO: make a statuscolumn
  -- _G.statusColumn = function()
  --   return "bingus"
  -- end
  -- vim.o.statuscolumn = "%!v:lua.statusColumn()"
  '';

  config.extraConfigLuaPost = /*lua*/ ''
  vim.api.nvim_create_augroup("PlainTextSettings", { clear = true })

  vim.api.nvim_create_autocmd("FileType", {
    group = "PlainTextSettings",
    pattern = vim.g.plain_text_types,
    callback = function()
      vim.opt.cursorline = false
      vim.opt.foldcolumn = "0"
      vim.opt.number = false
      if vim.fn.exists(':IBLDisable') == 2 then
        vim.cmd('IBLDisable')
      end
    end,
  })
  '';
}
