require("catppuccin").setup({
  flavour = "macchiato", -- latte, frappe, macchiato, mocha
  background = {         -- :h background
    light = "latte",
    dark = "mocha",
  },
  transparent_background = true, -- disables setting the background color.
  integrations = {
    -- cmp = true,
    -- dap = true,
    -- dap_ui = true,
    -- nvimtree = true,
    -- harpoon = true,
    -- markdown = true,
    -- gitsigns = true,
    -- telescope = {
    --   enabled = true,
    --   -- style = "nvchad"
    -- },
    -- treesitter_context = true,
    -- treesitter = true,
    -- native_lsp = {
    --   enabled = true,
    --   virtual_text = {
    --     errors = { "italic" },
    --     hints = { "italic" },
    --     warnings = { "italic" },
    --     information = { "italic" },
    --   },
    --   underlines = {
    --     errors = { "underline" },
    --     hints = { "underline" },
    --     warnings = { "underline" },
    --     information = { "underline" },
    --   },
    --   inlay_hints = {
    --     background = true,
    --   },
    -- },
    -- lsp_trouble = true,
    -- indent_blankline = {
    --   enabled = true,
    --   scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
    --   colored_indent_levels = true,
    -- },
  }
})

---@diagnostic disable-next-line: undefined-global
vim.cmd.colorscheme "catppuccin"
