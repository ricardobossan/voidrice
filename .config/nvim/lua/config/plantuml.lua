local M = {}

-- Func: Output diagram from current puml file.
local plantumlOutputSingle = function()
  vim.cmd(":! /usr/bin/plantuml " .. "%" .. " -o ./out -tsvg")
end

-- TODO Só copia arquivo atualainda
-- Func: Output diagrams from current working directory.
local plantumlOutputAll = function()
  vim.cmd(":! /usr/bin/plantuml ./**/*.puml -o ./out -tsvg")
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "plantuml" },
  command = "setlocal foldmethod=marker",
})

return M
