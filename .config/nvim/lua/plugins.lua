local plugins = {
  -- Explorador de arquivos

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    commit = "ed6c92d6708e5208360347f2281de99602061dc8",
    tag = "*",
    config = function()
      require("toggleterm").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    commit = "b23856a88e04e1468e1603d6e0900f2372709e22",
    --{ run = ':TSUpdate' }
  },

  {
    "nvim-telescope/telescope.nvim",
    --tag = '0.1.1',
    commit = "87e92ea31b2b61d45ad044cf7b2d9b66dad2a618",

    -- or                            , branch = '0.1.x',
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },

  {
    "morhetz/gruvbox",
    commit = "bf2885a95efdad7bd5e4794dd0213917770d79b7",
    --as = "gruvbox"
    --config = function()
    --vim.cmd[[
    --colorscheme gruvbox
    --]]
    --end
  },

  {
    "mbbill/undotree",
    commit = "1a23ea84bd02c34f50d8e10a8b4bfc89597ffe4e",
  },

  {
    "stevearc/conform.nvim",
    opts = {},
  },

  -- TODO: Install nvim-lightbulb
  -- TODO: stevearc/dressing.nvim
  --
  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    --branch = "v1.x",
    commit = "934a3fdf5072b8cb9da16aadd101901cd1541f3e",
    dependencies = {
      -- LSP Support
      { "neovim/nvim-lspconfig",             commit = "886ef7bd76b08d86de3bca6ed9373d2e95c31c55" }, -- Required
      { "williamboman/mason.nvim",           commit = "2311d9d883eb709ad9979a726a38c5ce1343b63c" }, -- Optional
      { "williamboman/mason-lspconfig.nvim", commit = "a8d5db8f227b9b236d1c54a9c6234bc033825ce7" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp",                  commit = "feed47fd1da7a1bad2c7dca456ea19c8a5a9823a" }, -- Required
      { "hrsh7th/cmp-nvim-lsp",              commit = "78924d1d677b29b3d1fe429864185341724ee5a2" }, -- Required
      { "hrsh7th/cmp-buffer",                commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }, -- Optional
      { "hrsh7th/cmp-path",                  commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }, -- Optional
      { "saadparwaiz1/cmp_luasnip",          commit = "18095520391186d634a0045dacaa346291096566" }, -- Optional
      { "hrsh7th/cmp-nvim-lua",              commit = "44acf47b28ff77b4b18d69d5b51b03184c87ccdf" }, -- Optional
      { "hrsh7th/cmp-emoji",                 commit = "19075c36d5820253d32e2478b6aaf3734aeaafa0" },
      -- Snippets
      { "L3MON4D3/LuaSnip",                  commit = "58fbfc627a93281a77f7d161d4ff702e639677b1" }, -- Required
      { "rafamadriz/friendly-snippets",      commit = "25ddcd96540a2ce41d714bd7fea2e7f75fea8ead" }, -- Optional
    },
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
---@diagnostic disable-next-line: redundant-parameter
      require("lsp_signature").setup(opts)
    end,
  },
  { "Hoffs/omnisharp-extended-lsp.nvim", commit = "4be2e8689067494ed7e5a4f1221adc31d1a07783"},

  { "OmniSharp/omnisharp-vim",          commit = "5ce267481d79d1dc5f7fb2c96ef74e71910b7024" },

  -- Markdown

  { "godlygeek/tabular",                 commit = "339091ac4dd1f17e225fe7d57b48aff55f99b23a" },
  {
    "jakewvincent/mkdnflow.nvim",
    commit = "51cf944514e49662cca8a075b1a8f485c2c39d0f",
    config = function()
      require("mkdnflow").setup({})
    end,
    ft = "markdown",
  },

  {
    "preservim/vim-markdown",
    commit = "df4be8626e2c5b2a42eb60e1f100fce469b81f7d",
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install", -- can't use npm. See https://github.com/npm/cli/issues/5126
    dependencies = { "zhaozg/vim-diagram", "aklt/plantuml-syntax" },
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- auto closing
  { "windwp/nvim-autopairs",  commit = "ae5b41ce880a6d850055e262d6dfebd362bb276e" }, -- autoclose parens, brackets, quotes, etc...

  { "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter" },                  -- autoclose tags

  {
    "nvim-neorg/neorg",
    commit = "9766bef893ec993af9408ea0d44a8f13adbd1e80",
    opts = true,
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.presenter"] = {
            config = {
              zen_mode = "truezen",
            },
          },
        },
      })
    end,
    ft = "norg",
    dependencies = {
      { "nvim-lua/plenary.nvim", commit = "0c31c398261567cda89b66ddffc69d39495f63ae" },
      { "Pocco81/TrueZen.nvim",  commit = "a31109cd423121e1154ae0844fb312086428306f" },
      { "nvim-treesitter" },
    },
  },

  {
    "phaazon/mind.nvim",
    commit = "e59c52758c399caceb549c698cfa2d65e6bbb9f9",
    opts = true,
    dependencies = { "nvim-lua/plenary.nvim", commit = "0c31c398261567cda89b66ddffc69d39495f63ae" },
    config = function()
      require("mind").setup()
    end,
  },

  --{ "kyazdani42/nvim-web-devicons", commit = "bb6d4fd1e010300510172b173ab5205d37af084f" },

  {
    "kyazdani42/nvim-tree.lua",
    commit = "08a0aa1a3b7411ee0a7887c8818528b1558cef96",
  },

  {
    "akinsho/bufferline.nvim",
    commit = "84b0822b2af478d0b4f7b0f9249ca218855331db",
    dependencies = "nvim-tree/nvim-web-devicons",
  },

  -- WhichKey
  -- Lua
  {
    "folke/which-key.nvim",
    commit = "5224c261825263f46f6771f1b644cae33cd06995",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      --require("config.whichkey").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      --}
    end,
  },
  -- Lua
  {
    "folke/trouble.nvim",
    commit = "67337644e38144b444d026b0df2dc5fa0038930f",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },

  {
    "nvim-lua/plenary.nvim",
    commit = "253d34830709d690f013daf2853a9d21ad7accab",
  },

  -- Comments
  {
    "numToStr/Comment.nvim",
    commit = "0236521ea582747b58869cb72f70ccfa967d2e89",
  },

  -- Todo highlight
  {
    "folke/todo-comments.nvim",
    commit = "077c59586d9d0726b0696dc5680eb863f4e04bc5",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("config.todocomments").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },

  {
    "mfussenegger/nvim-dap",

    dependencies = {

      -- fancy UI for the debugger
      {
        "rcarriga/nvim-dap-ui",
        -- stylua: ignore
        keys = {
          { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
          { "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
        },
        opts = {},
        config = function(_, opts)
          -- setup dap config by VsCode launch.json file
          -- require("dap.ext.vscode").load_launchjs()
          local dap = require("dap")
          local dapui = require("dapui")
          dapui.setup(opts)
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close({})
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close({})
          end
        end,
      },

      -- virtual text for the debugger
      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },

      -- which key integration
      {
        "folke/which-key.nvim",
        optional = true,
        opts = {
          defaults = {
            ["<leader>d"] = { name = "+debug" },
          },
        },
      },

      -- mason.nvim integration
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = "mason.nvim",
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
          -- Makes a best effort to setup the various debuggers with
          -- reasonable debug configurations
          automatic_installation = true,

          -- You can provide additional configuration to the handlers,
          -- see mason-nvim-dap README for more information
          handlers = {},

          -- You'll need to check that you have the required things installed
          -- online, please don't ask me how to install them :)
          ensure_installed = {
            -- Update this to ensure that you have the debuggers for the langs you want
          },
        },
      },
    },

    -- stylua: ignore
    keys = {
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      { "<leader>db", function() require("dap").toggle_breakpoint() end,                                    desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end,                                             desc = "Continue" },
      { "<leader>da", function() require("dap").continue({ before = get_args }) end,                        desc = "Run with Args" },
      { "<leader>dC", function() require("dap").run_to_cursor() end,                                        desc = "Run to Cursor" },
      { "<leader>dg", function() require("dap").goto_() end,                                                desc = "Go to line (no execute)" },
      { "<leader>di", function() require("dap").step_into() end,                                            desc = "Step Into" },
      { "<leader>dj", function() require("dap").down() end,                                                 desc = "Down" },
      { "<leader>dk", function() require("dap").up() end,                                                   desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end,                                             desc = "Run Last" },
      { "<leader>do", function() require("dap").step_out() end,                                             desc = "Step Out" },
      { "<leader>dO", function() require("dap").step_over() end,                                            desc = "Step Over" },
      { "<leader>dp", function() require("dap").pause() end,                                                desc = "Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end,                                          desc = "Toggle REPL" },
      { "<leader>ds", function() require("dap").session() end,                                              desc = "Session" },
      { "<leader>dt", function() require("dap").terminate() end,                                            desc = "Terminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end,                                     desc = "Widgets" },
    },

    config = function()
      local Config = {
        -- colorscheme can be a string like `catppuccin` or a function that will load the colorscheme
        ---@type string|fun()
        colorscheme = function()
          require("tokyonight").load()
        end,
        -- load the default settings
        defaults = {
          autocmds = true, -- lazyvim.config.autocmds
          keymaps = true, -- lazyvim.config.keymaps
          -- lazyvim.config.options can't be configured here since that's loaded before lazyvim setup
          -- if you want to disable loading options, add `package.loaded["lazyvim.config.options"] = true` to the top of your init.lua
        },
        news = {
          -- When enabled, NEWS.md will be shown when changed.
          -- This only contains big new features and breaking changes.
          lazyvim = true,
          -- Same but for Neovim's news.txt
          neovim = false,
        },
        -- icons used by other plugins
        -- stylua: ignore
        icons = {
          misc = {
            dots = "󰇘",
          },
          dap = {
            Stopped             = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
            Breakpoint          = " ",
            BreakpointCondition = " ",
            BreakpointRejected  = { " ", "DiagnosticError" },
            LogPoint            = ".>",
          },
          diagnostics = {
            Error = " ",
            Warn  = " ",
            Hint  = " ",
            Info  = " ",
          },
          git = {
            added    = " ",
            modified = " ",
            removed  = " ",
          },
          kinds = {
            Array         = " ",
            Boolean       = "󰨙 ",
            Class         = " ",
            Codeium       = "󰘦 ",
            Color         = " ",
            Control       = " ",
            Collapsed     = " ",
            Constant      = "󰏿 ",
            Constructor   = " ",
            Copilot       = " ",
            Enum          = " ",
            EnumMember    = " ",
            Event         = " ",
            Field         = " ",
            File          = " ",
            Folder        = " ",
            Function      = "󰊕 ",
            Interface     = " ",
            Key           = " ",
            Keyword       = " ",
            Method        = "󰊕 ",
            Module        = " ",
            Namespace     = "󰦮 ",
            Null          = " ",
            Number        = "󰎠 ",
            Object        = " ",
            Operator      = " ",
            Package       = " ",
            Property      = " ",
            Reference     = " ",
            Snippet       = " ",
            String        = " ",
            Struct        = "󰆼 ",
            TabNine       = "󰏚 ",
            Text          = " ",
            TypeParameter = " ",
            Unit          = " ",
            Value         = " ",
            Variable      = "󰀫 ",
          },
        },
        ---@type table<string, string[]|boolean>?
        kind_filter = {
          default = {
            "Class",
            "Constructor",
            "Enum",
            "Field",
            "Function",
            "Interface",
            "Method",
            "Module",
            "Namespace",
            "Package",
            "Property",
            "Struct",
            "Trait",
          },
          markdown = false,
          help = false,
          -- you can specify a different filter for each filetype
          lua = {
            "Class",
            "Constructor",
            "Enum",
            "Field",
            "Function",
            "Interface",
            "Method",
            "Module",
            "Namespace",
            -- "Package", -- remove package since luals uses it for control flow structures
            "Property",
            "Struct",
            "Trait",
          },
        },
      }
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      for name, sign in pairs(Config.icons.dap) do
        sign = type(sign) == "table" and sign or { sign }
        vim.fn.sign_define(
          "Dap" .. name,
          { text = sign[1], texthl = sign[2] or "DiagnosticInfo", linehl = sign[3], numhl = sign[3] }
        )
      end
    end,
  },

  {
    "aklt/plantuml-syntax",
    commit = "845abb56dcd3f12afa6eb47684ef5ba3055802b8",
  },

  {
    "vimwiki/vimwiki",
    commit = "c5b7f7e76f7d9b07036948a2f9c1d6cd0167e884",
  },
  {
    "mrjones2014/legendary.nvim",
    version = "v2.1.0",
    -- since legendary.nvim handles all your keymaps/commands,
    -- its recommended to load legendary.nvim before other plugins
    priority = 10000,
    lazy = false,
    -- sqlite is only needed if you want to use frecency sorting
    -- dependencies = { 'kkharji/sqlite.lua' }
  },
  {
    "lewis6991/gitsigns.nvim",
  },
  -- ChatGPT
  --[[
  local home = vim.fn.expand("$HOME")
  {
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "gpg --decrypt " .. home .. "/.local/share/password-store/_pro_tools/chatgpt.gpg",
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  }
-]]
  -- FIX: Não faz view para diagramas de classe
  {
    "weirongxu/plantuml-previewer.vim",
    commit = "c0a9e42ad004b706ed3a097c839932110e75aae4",
  },

  {
    "tyru/open-browser.vim",
    commit = "7d4c1d8198e889d513a030b5a83faa07606bac27",
  },
}

--[[
  use {
    "moll/vim-bbye",
    commit = "25ef93ac5a87526111f43e5110675032dbcacf56"
  },
--]]
--
-- Snapshots
--[[
  --- Load snapshot from file
  local default_snapshot = packer.load(vim.fn.expand("/home/ricar/.cache/nvim/packer.nvim/2023-02-16.json"))
  -- Set the loaded snapshot as the default
  packer.set_default(default_snapshot)
  packer.dir.snapshots = vim.fn.expand("~/.config/nvim/packer/snapshots")
  --]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins)
