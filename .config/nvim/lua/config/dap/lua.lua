local M = {}


function M.setup()
  local dap = require("dap")
  dap.adapters["local-lua"] = {
    type = "executable",
    command = "node",
    args = {
      "/home/ricar/.install/local-lua-debugger-vscode/extension/debugAdapter.ts",
    },
    enrich_config = function(config, on_config)
      if not config["extensionPath"] then
        local c = vim.deepcopy(config)
        -- 💀 If this is missing or wrong you'll see
        -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
        c.extensionPath = "/home/ricar/.install/local-lua-debugger-vscode/"
        on_config(c)
      else
        on_config(config)
      end
    end,
  }

  dap.configurations.lua = { {} }
end

return M
