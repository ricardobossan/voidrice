local telescope = require('telescope')

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--hidden",
			"--smart-case",
		},
	},
})

telescope.load_extension('dap')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', 'telescope.builtin.find_files find_command=rg,--ignore,--hidden,--glob="!.git/*"', {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', 'telescope.builtin.buffers show_all_buffers=true')
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
