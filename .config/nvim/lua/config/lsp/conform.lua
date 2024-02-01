local M

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    --python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
    markdown = { "markdownlint", "markdown-toc", "cbfmt", "prettier", "prettierd" },
  },

})

return M
