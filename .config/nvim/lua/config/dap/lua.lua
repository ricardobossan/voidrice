local M = {}

-- Function to check if the operating system is Windows
local function is_windows()
	return package.config:sub(1, 1) == "\\"
end -- Function to adjust paths and commands based on the operating system

local function adjust_paths_and_commands()
	local separator = package.config:sub(1, 1) -- Path separator

	local debug_adapter_path
	local extension_path

	if is_windows() then
		debug_adapter_path = HOME ..  "\\AppData\\Local\\nvim-data\\local-lua-debugger-vscode\\extension\\debugAdapter.js"
		extension_path = HOME .. "\\AppData\\Local\\nvim-data\\local-lua-debugger-vscode\\"
	else
		debug_adapter_path = HOME .. "/.local/share/nvim/local-lua-debugger-vscode/extension/debugAdapter.js"
		extension_path = HOME .. "/.local/share/nvim/local-lua-debugger-vscode/"
	end

	return debug_adapter_path, extension_path
end

function M.setup()
	local dap = require("dap")

	local debug_adapter_path, extension_path = adjust_paths_and_commands()

	dap.adapters["local-lua"] = {
		type = "executable",
		command = "node",
		args = { debug_adapter_path },
		enrich_config = function(config, on_config)
			if not config["extensionPath"] then
				local c = vim.deepcopy(config)
				c.extensionPath = extension_path
				on_config(c)
			else
				on_config(config)
			end
		end,
	}

	dap.configurations.lua = {
		{
			name = 'Launch',
			type = 'local-lua',
			request = 'launch',
			cwd = '${workspaceFolder}',
			program = {
				lua = 'lua',
				file = '${file}',
			},
			args = {},
		}
	}
end

return M
