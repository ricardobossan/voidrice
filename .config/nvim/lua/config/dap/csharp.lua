local M = {}

-- Debugger installation location
local DEBUGGER_LOCATION = HOME ..
		PS ..
		".local" ..
		PS ..
		"share" ..
		PS .. "nvim" .. PS .. "mason" .. PS .. "packages" .. PS .. "netcoredbg"

function M.setup()
	local dap = require("dap")

	-- Adapter configuration
	dap.adapters.coreclr = {
		type = "executable",
		command = DEBUGGER_LOCATION .. PS .. "netcoredbg",
		args = { "--interpreter=vscode" },
	}

	-- Configuration
	dap.configurations.cs = {
		{
			type = "coreclr",
			name = "attach - netcoredbg",
			request = "attach",
			processId = require("dap.utils").pick_process,
			args = {},
		},
		{
			type = "coreclr",
			name = "launch - netcoredbg",
			request = "launch",
			program = function()
				return vim.fn.input("Path to DLL > ", vim.fn.getcwd() .. PS .. "bin" .. PS .. "Debug" .. PS , "file")
			end,
		},
	}
end

return M
