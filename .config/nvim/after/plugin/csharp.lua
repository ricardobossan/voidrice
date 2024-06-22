-- NOTE: Depends on vsnip, vsnip-integ, and vim-csharp
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" },
	{
		pattern = { "*.cshtml", "*.razor" },
		command = [[set filetype=html.cshtml.razor]]
	})
