function ForceMarkdown()
  vim.cmd("set filetype=markdown")
  vim.cmd("set syntax=markdown")
end

vim.api.nvim_create_autocmd({"BufWinEnter","BufEnter","BufRead","BufNewFile"}, {
  pattern = { "markdown", "*.md", "~/.local/share/calcurse/notes/*", "/tmp/calcurse-note*" },
  command = [[lua ForceMarkdown()]]
})

vim.schedule_wrap(function()
  vim.api.nvim_command("autocmd BufNewFile,BufRead ~/.local/share/calcurse/notes/* lua ForceMarkdown()")
  vim.api.nvim_command("autocmd BufNewFile,BufRead /**/*.md lua ForceMarkdown()")
end)

-- Copia para clipboard do sistema
vim.cmd("set clipboard+=unnamedplus")
