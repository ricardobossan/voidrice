function ForceMarkdown()
  vim.cmd("set filetype=markdown")
  vim.cmd("set syntax=markdown")
end

local HOME = os.getenv "HOME"
local notesCustom = HOME .. "/calcurse/notes/*"
local notesDefault = HOME .. "/.local/share/calcurse/notes/*"
local noteBuff = "/tmp/calcurse-note*"

vim.api.nvim_create_autocmd({ "BufWinEnter", "BufEnter", "BufRead", "BufNewFile" }, {
  pattern = { "markdown", "*.md", noteBuff, notesDefault, notesCustom },
  command = [[lua ForceMarkdown()]]
})

--[[ -- TODO: After a while, if it makes no difference, delete:
    vim.schedule_wrap(function()
      vim.api.nvim_command("autocmd BufNewFile,BufRead ~/.local/share/calcurse/notes/* lua ForceMarkdown()")
      vim.api.nvim_command("autocmd BufNewFile,BufRead /**/*.md lua ForceMarkdown()")
    end)
--]]

-- Copia para clipboard do sistema
vim.cmd("set clipboard+=unnamedplus")
