require("catppuccin").setup({
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  background = {     -- :h background
    light = "latte",
    dark = "mocha",
  },
  custom_highlights = function()
    return {
      --CursorLineNr = { fg = '#FF8FFF' },
      LineNr = { fg = '#f9e2af' },
      -- CursorLine = { bg = '#252525' },
      -- ColorColumn = { bg = '#252525' },
      -- GitSignsAdd = { fg = '#467555' },
      -- GitSignsChange = { fg = '#856f3a' },
      -- GitSignsDelete = { fg = '#753b34' },
      -- TelescopeBorder = { fg = '#FFFFFF' },
    }
  end,
  -- Only apply transparency when not in Windows OS
  transparent_background = false --not vim.loop.os_uname().version:match("Windows") and false or true,
  --[[
  integrations = {
    cmp = true,
    dap = true,
    dap_ui = true,
    nvimtree = true,
    harpoon = true,
    markdown = true,
    gitsigns = true,
    telescope = {
      enabled = true,
      -- style = "nvchad"
    },
    treesitter_context = true,
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
      inlay_hints = {
        background = true,
      },
    },
    lsp_trouble = true,
    indent_blankline = {
      enabled = true,
      scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
      colored_indent_levels = true,
    },
  }
  --]]
})

---@diagnostic disable-next-line: undefined-global
vim.cmd.colorscheme "catppuccin"
