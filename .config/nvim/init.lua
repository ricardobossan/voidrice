---[[ Global Variables
function Is_windows()
	return package.config:sub(1, 1) == "\\"
end -- Function to adjust paths and commands based on the operating system


local function getHome_OSAgnostic()
	if os.getenv("HOME") then
		return os.getenv("HOME")
	elseif os.getenv("USERPROFILE") then
		return os.getenv("USERPROFILE")
	else
		error("Unable to determine the home directory.")
	end
end

HOME = getHome_OSAgnostic()

-- @brief Path separator based on the operating system
PS = package.config:sub(1, 1)
--]]

require("plugins")
require("config")
require("bufferline").setup({})
require('colorizer').setup()
require('diagflow').setup()
require("colorizer").setup()
require("config.nvimtree")
require("config.copilot").setup()
require("config.remap")
require("config.set")
require("config.markdown")
--require('config.lsp')
require("config.gitsigns").setup()
require("config.octo").setup()
require("config.whichkey")
require("config.icons")
require("config.comment")
require("config.todocomments")
require("config.autopairs")
require("config.lightbulb")
require("config.lsp.autocomplete")
require("config.lsp.conform")
require("config.transparent").setup()
require("config.obsidian").setup()
require("config.lsp.lsp_signature").setup()
require("config.dap.init").setup()
