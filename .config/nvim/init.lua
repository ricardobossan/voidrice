require("plugins")
require("config")
require("bufferline").setup({})
require("config.nvimtree")
require("config.remap")
require("config.set")
require("config.markdown")
--require('config.lsp')
require("config.gitsigns")
require("config.whichkey")
require("config.icons")
require("config.comment")
require("config.todocomments")
require("config.autopairs")
require("config.lightbulb")
require("config.lsp.autocomplete")
require("config.lsp.conform")
require("config.copilot")
require("config.lsp.keymaps")
require("config.obsidian").setup()
require("config.lsp.lsp_signature").setup()
require("config.dap.init").setup()
