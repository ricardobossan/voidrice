local M = {}


local plantuml = require("config.plantuml")
local builtin = require("telescope.builtin")
local whichkey = require("which-key")
local legendary = require("legendary")

local keymap = vim.keymap.set

local function keymappings(client, bufnr)
  local opts = {
    mode = "n",
    prefix = "<leader>",
    --buffer = nil,
    buffer = bufnr,
    silent = true,
    noremap = true,
    nowait = false,
  }

  -- Key mappings
  -- buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  -- vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
  --keymap("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

  keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
  keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)

  -- Whichkey
  local keymap_l = {
 }
  if client.server_capabilities.documentFormattingProvider then
    keymap_l.l.F = { "<cmd>lua vim.lsp.buf.format({async = true})<CR>", "Format Document" }
  end

  local keymap_g = {
    name = "Goto",
    d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
    -- d = { "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", "Definition" },
    D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
    h = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    I = { "<cmd>Telescope lsp_implementations<CR>", "Goto Implementation" },
    b = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
    u = { "<cmd>lua Open_browser_with_url()<CR>", "Url under cursor" },
    -- b = { "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", "Goto Type Definition" },
  }

  local keymap_v_l = {
    l = {
      name = "LSP",
      a = { "<cmd>'<,'>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
    },
  }


  -- Register Keymaps on both legendary and whichkey
  legendary.setup({ which_key = { auto_register = true } })

  -- LSP
  local o = { buffer = bufnr, prefix = "<leader>" }
  whichkey.register(keymap_l, o)
  legendary.bind_whichkey(keymap_l, o, false)

  -- Visual Mode
  o = { mode = "v", buffer = bufnr, prefix = "<leader>" }
  whichkey.register(keymap_v_l, o)
  legendary.bind_whichkey(keymap_v_l, o, false)

  -- Goto
  o = { buffer = bufnr, prefix = "g" }
  whichkey.register(keymap_g, o)
  legendary.bind_whichkey(keymap_g, o, false)


end

-- local function signature_help(client, bufnr)
--   local trigger_chars = client.server_capabilities.signatureHelpProvider.triggerCharacters
--   for _, char in ipairs(trigger_chars) do
--     vim.keymap.set("i", char, function()
--       vim.defer_fn(function()
--         pcall(vim.lsp.buf.signature_help)
--       end, 0)
--       return char
--     end, {
--       buffer = bufnr,
--       noremap = true,
--       silent = true,
--       expr = true,
--     })
--   end
-- end

function M.setup(client, bufnr)
  keymappings(client, bufnr)
  -- signature_help(client, bufnr) -- use cmp-nvim-lsp-signature-help
end

return M
