local M = {}

-- Debugger installation location
local DEBUGGER_LOCATION = ""

if(Is_windows()) then
	DEBUGGER_LOCATION = os.getenv("USERPROFILE") ..
		PS ..
		"AppData" ..
		PS ..
		"Local" ..
		PS .. "nvim-data" .. PS .. "mason" .. PS .. "packages" .. PS .. "netcoredbg" .. PS .. "netcoredbg"
else
	DEBUGGER_LOCATION = os.getenv("HOME") ..
		PS ..
		".local" ..
		PS ..
		"share" ..
		PS .. "nvim" .. PS .. "mason" .. PS .. "packages" .. PS .. "netcoredbg"
end

function M.setup()
	local dap = require("dap")

	local command = ""
	
	if(Is_windows()) then
	command = DEBUGGER_LOCATION .. PS .. "netcoredbg.exe"
	else
	command = DEBUGGER_LOCATION .. PS .. "netcoredbg"
	end

	-- Adapter configuration
	dap.adapters.coreclr = {
		type = "executable",
		command = command,
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
