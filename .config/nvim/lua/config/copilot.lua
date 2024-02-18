local M = {}

function M.setup()
  vim.g.copilot_no_tab_map = true
  vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

  -- NOTE: Copilot module is not found
  --
  -- require('copilot').setup({
  --   panel = {
  --     enabled = true,
  --     auto_refresh = true,
  --     keymap = {
  --       jump_prev = "[[",
  --       jump_next = "]]",
  --       accept = "<CR>",
  --       refresh = "gr",
  --       open = "<M-CR>"
  --     },
  --     layout = {
  --       position = "bottom", -- | top | left | right
  --       ratio = 0.4
  --     },
  --   },
  --   suggestion = {
  --     enabled = true,
  --     auto_trigger = true,
  --     debounce = 75,
  --     keymap = {
  --       accept = "<M-l>",
  --       accept_word = true,
  --       accept_line = true,
  --       next = "<M-]>",
  --       prev = "<M-[>",
  --       dismiss = "<C-]>",
  --     },
  --   },
  --   filetypes = {
  --     yaml = true,
  --     markdown = true,
  --     help = true,
  --     gitcommit = true,
  --     gitrebase = true,
  --     hgcommit = true,
  --     svn = true,
  --     cvs = true,
  --     ["."] = true,
  --   },
  --   copilot_node_command = 'node', -- Node.js version must be > 18.x
  --   server_opts_overrides = {},
  -- })
end

return M
