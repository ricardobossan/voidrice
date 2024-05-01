vim.api.nvim_create_autocmd({ "BufEnter", "BufEnter", "BufRead", "BufNewFile" },
	{
		pattern = "*",
		command = [[set wrap linebreak]]
	})

-- Copia para clipboard do sistema
vim.cmd("set clipboard+=unnamedplus")
