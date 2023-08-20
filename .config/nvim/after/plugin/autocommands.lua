vim.schedule_wrap(function()
  vim.api.nvim_command("autocmd BufNewFile,BufRead *.md set syntax=markdown")
end)

-- Copia para clipboard do sistema
vim.cmd("set clipboard+=unnamedplus")
