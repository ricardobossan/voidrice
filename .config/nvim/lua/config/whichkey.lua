local plantuml = require("config.plantuml")
local builtin = require("telescope.builtin")

Mappings = {
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  --["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  --["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
  --["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
  ["h"] = { builtin.help_tags, "Help (Vimtutor)" },
  ["o"] = { "<cmd>only<CR>", "Only" },
  ["T"] = { "<cmd>ToggleTerm<cr>", "Terminal" },
  ["U"] = {
    name = "Plantuml",
    p = { "<cmd>PlantumlOpen<CR>", "Preview UML" },
    f = { plantuml.plantumlOutputSingle, "Print current file" },
    w = { plantuml.plantumlOutputAll, "Print all files in workspace" },
  },
  b = {
    name = "Buffers",
    ["b"] = {
      "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Buffers",
    },
    ["d"] = { "<cmd>bdelete!<CR>", "Close Buffer" },
  },
--[[
  d = {
    name = "Debug",
  },
--]]
  f = {
    name = "Find",
    ["f"] = { builtin.find_files, "Files" },
    ["g"] = { builtin.live_grep, "Text" },
    ["b"] = { builtin.buffers, "Buffers" },
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    i = { "<cmd>Trouble lsp_implementations<cr>", "References" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
  },

  g = {
    name = "Get",
    f = { "gf", "File" }
  },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  G = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
  },

  l = {
    name = "LSP",
    g = {
      name = "Generic",
      i = { "<cmd>LspInfo<cr>", "Info" },
      I = { "<cmd>Mason<cr>", "Installer Info" },
    },
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = {
      "<cmd>lua vim.diagnostic.setloclist()<cr>",
      "Document Diagnostics",
    },
    w = {
      "<cmd>Trouble workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
    j = {
      "<cmd>lua vim.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.diagnostic.goto_prev()<cr>",
      "Prev Diagnostic",
    },
    K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Documentation" },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    --q = { "<cmd>lua vim.diagnostic.set_loclist()<cr>", "Quickfix" },

    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    --n = { "<cmd>lua require('renamer').rename()<CR>", "Rename" },
    e = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
    t = { "<cmd>TroubleToggle document_diagnostics<CR>", "Document Diagnostics" },
    L = { "<cmd>lua vim.lsp.codelens.refresh()<CR>", "CodeLens" },
    D = { "<cmd>lua require('config.lsp').toggle_diagnostics()<CR>", "Toggle Inline Diagnostics" },
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    --h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },

  t = {
    name = "TODO",
    ["f"] = { "<cmd>TodoTrouble<CR>", "Todo Fast" },
    ["l"] = { "<cmd>TodoLocList<CR>", "Todo List" },
    ["s"] = { "<cmd>TodoTelescope<CR>", "Todo Telescope" },
  },
  --[[
  T = {
    name = "Terminal",
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },
--]]
}

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

local opts = {
  mode = "n",     -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global Mappings. Specify a buffer number for buffer local Mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}

function DynamicMappings()
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(buf, "filetype")
  -- FIX: Will uncomment when find out how to include calcurse notes
  --if ft == "markdown" then
  Mappings["m"] = {
    name = "Markdown",
    p = { "<cmd>MarkdownPreviewToggle<CR>", "Preview toggle" },
    c = { "<cmd>MkdnTableNewColAfter<CR>", "+ Column after" },
    C = { "<cmd>MkdnTableNewColBefore<CR>", "+ Column before" },
    r = { "<cmd>MkdnTableNewRowBelow<CR>", "+ Row below" },
    R = { "<cmd>MkdnTableNewRowAbove<CR>", "+ Row above" },
    t = { "<cmd>InsertToc<CR>", "Insert TOC" },
    T = { "<cmd>InsertNToc<CR>", "Insert TOC (numbered)" },
  }

  -- FIX: Got to remove the actual indexes for this table. ie. ["m"] and ["M"]
  --[[ TODO: Como remover indexes de tables em lua?
  else
    if Mappings["m"] ~= nil then
      Mappings["m"] = { "", "" }
      --print(KeyOf(Mappings, "m"))
    end
    if Mappings["M"] ~= nil then
      Mappings["M"] = { "", "" }
      --print(KeyOf(Mappings, "M"))
    end
    --]]
  --end

  which_key.setup(setup)
  which_key.register(Mappings, opts)
end

function KeyOf(tbl, value)
  for k, v in pairs(tbl) do
    if k == value then
      --print(k)
      return k
    end
  end
  return nil
end

vim.api.nvim_create_autocmd("BufEnter", { command = [[lua DynamicMappings()]] })
