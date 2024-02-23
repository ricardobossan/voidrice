local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  timeout_len = 500,
  plugins = {
    marks = true,       -- shows a list of your marks on ' and `
    registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true,   -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false,   -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,      -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = true,            -- bindings for folds, spelling and others prefixed with z
      g = true,            -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_Mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>",   -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded",       -- none, single, double, shadow
    position = "bottom",      -- bottom, top
    margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },                                             -- min and max height of the columns
    width = { min = 20, max = 50 },                                             -- min and max width of the columns
    spacing = 3,                                                                -- spacing between columns
    align = "left",                                                             -- align columns left, center or right
  },
  ignore_missing = true,                                                        -- enable this to hide Mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true,                                                             -- show help message on the command line when the popup is visible
  triggers = "auto",                                                            -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

-- function KeyOf(tbl, value)
--   ---@diagnostic disable-next-line: unused-local
--   for k, v in pairs(tbl) do
--     if k == value then
--       --print(k)
--       return k
--     end
--   end
--   return nil
-- end
--
-- function DynamicMappings()
--   local buf = vim.api.nvim_get_current_buf()
--   local ft = vim.api.nvim_buf_get_option(buf, "filetype")
--   -- FIX: Will uncomment when find out how to include calcurse notes
--   --if ft == "markdown" then
--
--   Mappings["m"] = {
--     name = "Markdown",
--     p = { "<cmd>MarkdownPreviewToggle<CR>", "Preview toggle" },
--     c = { "<cmd>MkdnTableNewColAfter<CR>", "+ Column after" },
--     C = { "<cmd>MkdnTableNewColBefore<CR>", "+ Column before" },
--     r = { "<cmd>MkdnTableNewRowBelow<CR>", "+ Row below" },
--     R = { "<cmd>MkdnTableNewRowAbove<CR>", "+ Row above" },
--     t = { "<cmd>InsertToc<CR>", "Insert TOC" },
--     T = { "<cmd>InsertNToc<CR>", "Insert TOC (numbered)" },
--   }
--
--   -- FIX: Got to remove the actual indexes for this table. ie. ["m"] and ["M"]
--   -- TODO: Como remover indexes de tables em lua?
--    else
--      if Mappings["m"] ~= nil then
--        Mappings["m"] = { "", "" }
--        --print(KeyOf(Mappings, "m"))
--      end
--      if Mappings["M"] ~= nil then
--        Mappings["M"] = { "", "" }
--        --print(KeyOf(Mappings, "M"))
--      end
--   --end
--
--   which_key.setup(setup)
--   which_key.register(Mappings, opts)
-- end
-- vim.api.nvim_create_autocmd("BufEnter", { command = [[lua DynamicMappings()]] })

which_key.setup(setup)
