-- formatter remark needs to be installed mannually: ```sh npm i remark ```
local api = vim.api
api.nvim_create_autocmd("BufEnter", { command = [[syntax on]] })

-- Generic autocommands bellow
api.nvim_create_autocmd("FileType", { pattern = "markdown", command = [[filetype plugin on]] })
api.nvim_create_autocmd("FileType", { pattern = "markdown", command = [[filetype plugin on]] })
api.nvim_create_autocmd("FileType", { pattern = "markdown", command = [[set syntax=markdown]] })
api.nvim_create_autocmd(
  "FileType",
  { pattern = "markdown", command = [[let g:vim_markdown_folding_style_pythonic = 1]] }
)
api.nvim_create_autocmd("FileType", { pattern = "markdown", command = [[let g:vim_markdown_folding_level = 1]] }) -- Folds only when new buffer is oppened
api.nvim_create_autocmd("FileType", { pattern = "markdown", command = [[let g:vim_markdown_toc_autofit = 1]] })
api.nvim_create_autocmd("FileType", { pattern = "markdown", command = [[let g:vim_markdown_follow_anchor = 1]] })
api.nvim_create_autocmd("FileType", { pattern = "markdown", command = [[let g:vim_markdown_frontmatter = 1]] })
api.nvim_create_autocmd("FileType", { pattern = "markdown", command = [[let g:vim_markdown_toml_frontmatter = 1]] })
api.nvim_create_autocmd("FileType", { pattern = "markdown", command = [[let g:vim_markdown_json_frontmatter = 1]] })
api.nvim_create_autocmd("FileType", { pattern = "markdown", command = [[let g:vim_markdown_strikethrough = 1]] })
api.nvim_create_autocmd("FileType", { pattern = "markdown", command = [[let g:vim_markdown_new_list_item_indent = 2]] })
api.nvim_create_autocmd("FileType", { pattern = "markdown", command = [[let g:vim_markdown_edit_url_in = 'tab']] })
api.nvim_create_autocmd("FileType", { pattern = "markdown", command = [[set conceallevel=3]] })
--api.nvim_create_autocmd("BufEnter", { command = [[set foldlevel=1]] }) -- Folds everytime it switches between oppend files
--
api.nvim_create_autocmd("FileType", { pattern = "markdown", command = [[let g:mkdp_browser = '/usr/bin/firefox']] })
api.nvim_create_autocmd("BufEnter", { command = [[set wrap linebreak]] })
api.nvim_create_autocmd("FileType",
  { pattern = "markdown", command = "let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'csharp=cs']" })
