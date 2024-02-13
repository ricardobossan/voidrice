local M = {}

function M.setup()
  require("obsidian").setup(
    {
      workspaces = {
        {
          name = "Zettelkasten",
          path = "~/zettelkasten/Zettelkasten/"
        }
      },
  templates = {
    subdir = "templates",
    date_format = "%Y-%m-%d",
    time_format = "%H:%M:%S",
    -- A map for custom variables, the key should be the variable and the value a function
    substitutions = {},
  },
    }
  )
end

return M
