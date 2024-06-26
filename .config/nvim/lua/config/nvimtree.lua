-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				--{ key = "u", action = "dir_up" },
			},
		},
	},
	renderer = {
		group_empty = false,
	},
	filters = {
		dotfiles = true,
	},
})

local function open_nvim_tree(data)
	--[[
	-- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
	if data.file ~= nil then
		vim.cmd.cd(data.file)
	end
	--]]

	-- open the tree
	require("nvim-tree.api").tree.open()
	--vim.cmd("SessionRestore")
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
