local M = {}

function M.setup()
	require("transparent").setup({ -- Optional, you don't have to run setup.
		extra_groups = { "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
			"NvimTreeNormal"           -- NvimTree}, -- table: additional groups that should be cleared
		}
	})
end

return M
