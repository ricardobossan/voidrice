local packer = require("packer")

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return packer.startup(function(use)
  -- Packer can manage itself
  use({
    "wbthomason/packer.nvim",
    commit = "1d0cf98a561f7fd654c970c49f917d74fafe1530",
  })
  -- Explorador de arquivos

  -- Terminal
  use({
    "akinsho/toggleterm.nvim",
    commit = "ed6c92d6708e5208360347f2281de99602061dc8",
    tag = "*",
    config = function()
      require("toggleterm").setup()
    end,
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    commit = "b23856a88e04e1468e1603d6e0900f2372709e22",
    --{ run = ':TSUpdate' }
  })

  use({
    "nvim-telescope/telescope.nvim",
    --tag = '0.1.1',
    commit = "dce1156ca103b8222e4abbfc63f9c6887abf5ec6",

    -- or                            , branch = '0.1.x',
    requires = { { "nvim-lua/plenary.nvim" } },
  })

  use({
    "morhetz/gruvbox",
    commit = "bf2885a95efdad7bd5e4794dd0213917770d79b7",
    as = "gruvbox",
    --config = function()
    --vim.cmd[[
    --colorscheme gruvbox
    --]]
    --end
  })

  use({
    "mbbill/undotree",
    commit = "1a23ea84bd02c34f50d8e10a8b4bfc89597ffe4e",
  })

  -- Null-ls
  use({
    "jose-elias-alvarez/null-ls.nvim",
    commit = "7b2b28e207a1df4ebb13c7dc0bd83f69b5403d71",
    config = function()
      require("null-ls").setup()
    end,
    requires = { "nvim-lua/plenary.nvim", commit = "0c31c398261567cda89b66ddffc69d39495f63ae" },
  })

  -- LSP
  use({
    "VonHeikemen/lsp-zero.nvim",
    --branch = "v1.x",
    commit = "934a3fdf5072b8cb9da16aadd101901cd1541f3e",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig", commit = "886ef7bd76b08d86de3bca6ed9373d2e95c31c55" }, -- Required
      { "williamboman/mason.nvim", commit = "2311d9d883eb709ad9979a726a38c5ce1343b63c" }, -- Optional
      { "williamboman/mason-lspconfig.nvim", commit = "a8d5db8f227b9b236d1c54a9c6234bc033825ce7" }, -- Optional

      -- Autocompletion
      { "hrsh7th/nvim-cmp", commit = "feed47fd1da7a1bad2c7dca456ea19c8a5a9823a" }, -- Required
      { "hrsh7th/cmp-nvim-lsp", commit = "78924d1d677b29b3d1fe429864185341724ee5a2" }, -- Required
      { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }, -- Optional
      { "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }, -- Optional
      { "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }, -- Optional
      { "hrsh7th/cmp-nvim-lua", commit = "44acf47b28ff77b4b18d69d5b51b03184c87ccdf" }, -- Optional
      { "hrsh7th/cmp-emoji", commit = "19075c36d5820253d32e2478b6aaf3734aeaafa0" },
      -- Snippets
      { "L3MON4D3/LuaSnip", commit = "58fbfc627a93281a77f7d161d4ff702e639677b1" }, -- Required
      { "rafamadriz/friendly-snippets", commit = "25ddcd96540a2ce41d714bd7fea2e7f75fea8ead" }, -- Optional
    },
  })

  use({ "OmniSharp/omnisharp-vim", commit = "5ce267481d79d1dc5f7fb2c96ef74e71910b7024" })

  -- Markdown

  use({ "godlygeek/tabular", commit = "339091ac4dd1f17e225fe7d57b48aff55f99b23a" })
  use({
    "jakewvincent/mkdnflow.nvim",
    commit = "51cf944514e49662cca8a075b1a8f485c2c39d0f",
    config = function()
      require("mkdnflow").setup({})
    end,
    ft = "markdown",
  })

  use({
    "preservim/vim-markdown",
    commit = "df4be8626e2c5b2a42eb60e1f100fce469b81f7d",
  })

  use({
    "iamcco/markdown-preview.nvim",
    commit = "02cc3874738bc0f86e4b91f09b8a0ac88aef8e96",
    opt = true,
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
    cmd = { "MarkdownPreview" },
    requires = {
      { "zhaozg/vim-diagram", commit = "bd94f79ac6d701caf52a1b5547069c7b93cf6acf" },
      { "aklt/plantuml-syntax", commit = "845abb56dcd3f12afa6eb47684ef5ba3055802b8" },
    },
  })

  -- auto closing
  use({ "windwp/nvim-autopairs", commit = "ae5b41ce880a6d850055e262d6dfebd362bb276e" }) -- autoclose parens, brackets, quotes, etc...
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

  use({
    "nvim-neorg/neorg",
    commit = "9766bef893ec993af9408ea0d44a8f13adbd1e80",
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
    after = "nvim-treesitter",
    requires = {
      { "nvim-lua/plenary.nvim", commit = "0c31c398261567cda89b66ddffc69d39495f63ae" },
      { "Pocco81/TrueZen.nvim", commit = "a31109cd423121e1154ae0844fb312086428306f" },
    },
    disable = true,
  })

  use({
    "phaazon/mind.nvim",
    commit = "e59c52758c399caceb549c698cfa2d65e6bbb9f9",
    requires = { "nvim-lua/plenary.nvim", commit = "0c31c398261567cda89b66ddffc69d39495f63ae" },
    config = function()
      require("mind").setup()
    end,
    disable = true,
  })

  use({ "kyazdani42/nvim-web-devicons", commit = "bb6d4fd1e010300510172b173ab5205d37af084f" })

  use({
    "kyazdani42/nvim-tree.lua",
    commit = "08a0aa1a3b7411ee0a7887c8818528b1558cef96",
  })

  use({
    "akinsho/bufferline.nvim",
    commit = "84b0822b2af478d0b4f7b0f9249ca218855331db",
    requires = "nvim-tree/nvim-web-devicons",
  })

  -- WhichKey
  -- Lua
  use({
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
  })
  -- Lua
  use({
    "folke/trouble.nvim",
    commit = "67337644e38144b444d026b0df2dc5fa0038930f",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })

  use({
    "nvim-lua/plenary.nvim",
    commit = "253d34830709d690f013daf2853a9d21ad7accab",
  })

  -- Comments
  use({
    "numToStr/Comment.nvim",
    commit = "0236521ea582747b58869cb72f70ccfa967d2e89",
  })

  -- Todo highlight
  use({
    "folke/todo-comments.nvim",
    commit = "077c59586d9d0726b0696dc5680eb863f4e04bc5",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("config.todocomments").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })

  use({
    "mfussenegger/nvim-dap",
    commit = "5b986edc95cf7b37da1db91a5c149daa3ac008d2",
    config = function()
      require("config.dap").setup()
    end,
    opt = true,
    -- event = "BufReadPre",
    keys = { [[<leader>d]] },
    module = { "dap" },
    wants = { "nvim-dap-virtual-text", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" },
    requires = {
      -- "alpha2phi/DAPInstall.nvim",
      -- { "Pocco81/dap-buddy.nvim", branch = "dev" },
      { "theHamsta/nvim-dap-virtual-text", commit = "2971ce3e89b1711cc26e27f73d3f854b559a77d4" },
      { "rcarriga/nvim-dap-ui", commit = "rcarriga/nvim-dap-ui" },
      { "mfussenegger/nvim-dap-python", commit = "972b8b8b65823c433ee834ed02a7f06edf590dfc" },
      { "nvim-telescope/telescope-dap.nvim", commit = "313d2ea12ae59a1ca51b62bf01fc941a983d9c9c" },
      {
        "leoluz/nvim-dap-go",
        commit = "b4ded7de579b4e2a85c203388233b54bf1028816",
        module = "dap-go",
      },
      {
        "jbyuki/one-small-step-for-vimkind",
        commit = "a0729e2478759583a49c62966836beec46fc5e1d",
        module = "osv",
      },
    },
  })

  use({
    "rcarriga/nvim-dap-ui",
    commit = "bdb94e3853d11b5ce98ec182e5a3719d5c0ef6fd",
  })

  use({
    "aklt/plantuml-syntax",
    commit = "845abb56dcd3f12afa6eb47684ef5ba3055802b8",
  })

  use({
    "vimwiki/vimwiki",
    commit = "c5b7f7e76f7d9b07036948a2f9c1d6cd0167e884",
  })
  -- ChatGPT
  --[[
  local home = vim.fn.expand("$HOME")
  use({
    "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
        api_key_cmd = "gpg --decrypt " .. home .. "/.local/share/password-store/_pro_tools/chatgpt.gpg",
      })
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  })
-]]
  -- FIX: Não faz view para diagramas de classe
  use({
    "weirongxu/plantuml-previewer.vim",
    commit = "c0a9e42ad004b706ed3a097c839932110e75aae4",
  })

  use({
    "tyru/open-browser.vim",
    commit = "7d4c1d8198e889d513a030b5a83faa07606bac27",
  })

  --[[
  use {
    "moll/vim-bbye",
    commit = "25ef93ac5a87526111f43e5110675032dbcacf56"
  }
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
end)
