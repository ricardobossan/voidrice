local M = {}

function M.setup()
	require("obsidian").setup({
		workspaces = {
			{
				name = "Zettelkasten",
				path = "~/zettelkasten/",
			},
			{
				name = "bys",
				path = "~/projetos/bys/",
			},
			{
				name = "ricardo",
				path = "~/projetos/ricardo/",
				overrides = {
					daily_notes = {
						folder = "daily_notes",
						date_format = "%Y-%m-%d",
						template = "daily_notes_template.md",
					}
				}
			},
			{
				name = "Unilasalle",
				path = "~/projetos/unilasalle/",
			},
			{
				name = "src",
				path = "~/source/repos/"
			},
		},
		templates = {
			subdir = "templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
			-- A map for custom variables, the key should be the variable and the value a function
			substitutions = {},
		},
	})
end

return M
