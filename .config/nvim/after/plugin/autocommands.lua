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

-- Copia para clipboard do sistema
vim.cmd("set clipboard+=unnamedplus")
