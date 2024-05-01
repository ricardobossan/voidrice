local M = {}

local DEBUGGER_LOCATION = HOME .. PS .. ".local" .. PS .. "share" .. PS .. "nvim" .. PS .. "vscode-chrome-debug"

function M.setup()
  local dap = require "dap"

  dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = { DEBUGGER_LOCATION .. PS .. "out" .. PS .. "src" .. PS .. "chromeDebug.js" },
  }

  dap.configurations.javascript = {
    {
      type = "chrome",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}",
    },
  }

  dap.configurations.javascriptreact = {
    {
      type = "chrome",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}",
    },
  }

  dap.configurations.typescript = {
    {
      type = "chrome",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      --protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}",
    },
  }

  dap.configurations.typescriptreact = {
    {
      type = "chrome",
      request = "attach",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}",
    },
  }
end

return M
