local api = vim.api

-- Function to create autocmd groups
local function augroup(name)
    return vim.api.nvim_create_augroup("moaid_" .. name, { clear = true })
end

-- Function to set options for markdown files
local function setup_markdown_options()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
    vim.cmd("filetype plugin on")
    vim.cmd("set syntax=markdown")
    vim.g.vim_markdown_folding_style_pythonic = 1
    vim.g.vim_markdown_folding_level = 1
    vim.g.vim_markdown_toc_autofit = 1
    vim.g.vim_markdown_follow_anchor = 1
    vim.g.vim_markdown_frontmatter = 1
    vim.g.vim_markdown_toml_frontmatter = 1
    vim.g.vim_markdown_json_frontmatter = 1
    vim.g.vim_markdown_strikethrough = 1
    vim.g.vim_markdown_new_list_item_indent = 2
    vim.g.vim_markdown_edit_url_in = 'tab'
    vim.cmd("set conceallevel=2")
    vim.cmd("set wrap linebreak")
    vim.g.markdown_fenced_languages = {'html', 'python', 'bash=sh', 'csharp=cs'}
end

-- Auto commands for markdown files
augroup("markdown_autocmds")
api.nvim_create_autocmd("FileType", { pattern = "markdown", callback = setup_markdown_options })
augroup("")

-- Enable filetype plugin on buffer enter for markdown files
api.nvim_create_autocmd("FileType", {
group = augroup("filetype_plugin"),
pattern = "markdown",
command = "filetype plugin on",
})

-- Set foldlevel to 1 on buffer enter for markdown files
api.nvim_create_autocmd("BufEnter", {
group = augroup("foldlevel"),
pattern = "markdown",
command = "set foldlevel=1",
})

-- Close autocmd group definitions
augroup("")
