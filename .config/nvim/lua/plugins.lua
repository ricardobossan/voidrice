local plugins = {
	{
		-- Terminal
		"akinsho/toggleterm.nvim",
		commit = "ed6c92d6708e5208360347f2281de99602061dc8",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	},

	{
		"mrjones2014/legendary.nvim",
		commit = "67acc7d5ce7598ea159e1c689cc0f323bcbfb297",
		version = "v2.1.0",
		-- since legendary.nvim handles all your keymaps/commands,
		-- its recommended to load legendary.nvim before other plugins
		priority = 10000,
		lazy = false,
		-- sqlite is only needed if you want to use frecency sorting
		-- dependencies = { 'kkharji/sqlite.lua' }
	},

	{
		'stevearc/dressing.nvim',
		commit = "18e5beb3845f085b6a33c24112b37988f3f93c06",
		event = "VeryLazy",
		config = function()
			require("dressing").setup()
		end,
	},
	--
	-- LSP
	{
		"nvim-treesitter/nvim-treesitter",
		commit = "b444afa1dacd3d031c0ffe4763671d89afda5ddb",
		run = ":TSUpdate",
	},

	{
		"VonHeikemen/lsp-zero.nvim",
		--branch = "v1.x",
		commit = "934a3fdf5072b8cb9da16aadd101901cd1541f3e",
		dependencies = {
			-- LSP Support
			{
				"neovim/nvim-lspconfig",
				commit = "886ef7bd76b08d86de3bca6ed9373d2e95c31c55",
			}, -- Required
			{
				"williamboman/mason.nvim",
				commit = "2311d9d883eb709ad9979a726a38c5ce1343b63c",
			}, -- Optional
			{
				"williamboman/mason-lspconfig.nvim",
				commit = "a8d5db8f227b9b236d1c54a9c6234bc033825ce7",
			}, -- Optional

			-- Autocompletion
			{
				"hrsh7th/nvim-cmp",
				commit = "feed47fd1da7a1bad2c7dca456ea19c8a5a9823a",
			}, -- Required
			{
				"hrsh7th/cmp-nvim-lsp",
				commit = "78924d1d677b29b3d1fe429864185341724ee5a2",
			}, -- Required
			{
				"hrsh7th/cmp-buffer",
				commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
			}, -- Optional
			{
				"hrsh7th/cmp-path",
				commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
			}, -- Optional
			{
				"saadparwaiz1/cmp_luasnip",
				commit = "18095520391186d634a0045dacaa346291096566",
			}, -- Optional
			{
				"hrsh7th/cmp-nvim-lua",
				commit = "44acf47b28ff77b4b18d69d5b51b03184c87ccdf",
			}, -- Optional
			{
				"hrsh7th/cmp-emoji",
				commit = "19075c36d5820253d32e2478b6aaf3734aeaafa0",
			},
			{
				"hrsh7th/cmp-nvim-lsp-signature-help",
				commit = "3d8912ebeb56e5ae08ef0906e3a54de1c66b92f1",
			},
			-- Snippets
			{
				"L3MON4D3/LuaSnip",
				commit = "58fbfc627a93281a77f7d161d4ff702e639677b1",
			}, -- Required
			{
				"rafamadriz/friendly-snippets",
				commit = "25ddcd96540a2ce41d714bd7fea2e7f75fea8ead",
			}, -- Optional
		},
	},

	{
		"ray-x/lsp_signature.nvim",
		commit = "fed2c8389c148ff1dfdcdca63c2b48d08a50dea0",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			---@diagnostic disable-next-line: redundant-parameter
			require("lsp_signature").setup(opts)
		end,
	},

	{
		"onsails/lspkind.nvim",
		commit = "1735dd5a5054c1fb7feaf8e8658dbab925f4f0cf",
	},

	{
		'hrsh7th/vim-vsnip',
		commit = "02a8e79295c9733434aab4e0e2b8c4b7cea9f3a9"
	},

	{
		'hrsh7th/vim-vsnip-integ',
		commit = "1914e72cf3de70df7f5dde476cd299aba2440aef"
	},

	{
		'OrangeT/vim-csharp',
		commit = "b5982fc69bba7d507638a308d6875b031054280d"
	},

	-- Lazy
	{
		-- Better virtual text
		'dgagn/diagflow.nvim',
		commit = '6d2ad945ddbc46f42a0a2e7618975a5f3d2e7dbe',
		-- event = 'LspAttach', This is what I use personnally and it works great
		opts = {
			enable = true,
			max_width = 60,  -- The maximum width of the diagnostic messages
			max_height = 10, -- the maximum height per diagnostics
			severity_colors = { -- The highlight groups to use for each diagnostic severity level
				error = "DiagnosticFloatingError",
				warning = "DiagnosticFloatingWarn",
				info = "DiagnosticFloatingInfo",
				hint = "DiagnosticFloatingHint",
			},
			format = function(diagnostic)
				return diagnostic.message
			end,
			gap_size = 1,
			scope = 'cursor', -- 'cursor', 'line' this changes the scope, so instead of showing errors under the cursor, it shows errors on the entire line.
			padding_top = 0,
			padding_right = 0,
			text_align = 'right',                               -- 'left', 'right'
			placement = 'inline',                               -- 'top', 'inline'
			inline_padding_left = 0,                            -- the padding left when the placement is inline
			update_event = { 'DiagnosticChanged', 'BufReadPost' }, -- the event that updates the diagnostics cache
			toggle_event = {},                                  -- if InsertEnter, can toggle the diagnostics on inserts
			show_sign = false,                                  -- set to true if you want to render the diagnostic sign before the diagnostic message
			render_event = { 'DiagnosticChanged', 'CursorMoved' },
			border_chars = {
				top_left = "┌",
				top_right = "┐",
				bottom_left = "└",
				bottom_right = "┘",
				horizontal = "─",
				vertical = "│"
			},
			show_borders = false,
		}
	},

	{
		"utilyre/barbecue.nvim",
		commit = "cd7e7da622d68136e13721865b4d919efd6325ed",
		name = "barbecue",
		version = "*",
		dependencies = {
			{ "SmiteshP/nvim-navic",         commit = "5b44635e0022928b818bcf5ab31afb0589c185fd" },
			{ "nvim-tree/nvim-web-devicons", commit = "bb6d4fd1e010300510172b173ab5205d37af084f" }, -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},

	{
		"aznhe21/actions-preview.nvim",
		commit = "5072b1b1065a6b22bdd46b5c21780a91d6a08071",
		event = "VeryLazy",
		-- lazy = false,
		config = function()
			vim.keymap.set({ "v", "n" }, "<leader>la", require("actions-preview").code_actions)
		end,
	},

	--cp ~/.local/share/nvim/plugged/vim-csharp/snippets/*.snippets ~/.vsnip
	-- { 'hrsh7th/vim-vsnip' },
	--
	-- { 'OrangeT/vim-csharp' },
	--
	{
		"OmniSharp/omnisharp-vim",
		commit = "5ce267481d79d1dc5f7fb2c96ef74e71910b7024",
	},

	{
		"Hoffs/omnisharp-extended-lsp.nvim",
		commit = "4be2e8689067494ed7e5a4f1221adc31d1a07783",
	},

	-- { 'hrsh7th/vim-vsnip' },
	--
	-- { 'OrangeT/vim-csharp' },
	--
	-- :FIX: this is not working
	-- Allows for razor and blazor highlight
	-- {
	--   "jose-elias-alvarez/nvim-lsp-ts-utils",
	--   commit = "f
	-- {
	--   "jmederosalvarado/roslyn.nvim",
	--   commit = "8be8ec2e269a32cc1bed2d067c67182f04d85ec4"
	-- },

	-- Markdown
	{
		"godlygeek/tabular",
		commit = "339091ac4dd1f17e225fe7d57b48aff55f99b23a",
	},

	{
		"jakewvincent/mkdnflow.nvim",
		commit = "1b24b8b5fe10fe09af4572c0165293e0dcd998aa",
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
		commit = "a923f5fc5ba36a3b17e289dc35dc17f66d0548ee",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		dependencies = {
			{
				"zhaozg/vim-diagram",
				commit = "bd94f79ac6d701caf52a1b5547069c7b93cf6acf",
			},
			{
				"aklt/plantuml-syntax",
				commit = "845abb56dcd3f12afa6eb47684ef5ba3055802b8",
			},
		},
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
	},

	{
		"ellisonleao/glow.nvim",
		commit = "238070a686c1da3bccccf1079700eb4b5e19aea4",
		-- event = "VeryLazy",
		cmd = "Glow",
		ft = { "markdown", "md" },
		opts = {
			style = "dark",
		},
		-- config = function()
		-- 	require("glow").setup({
		-- 		style = "dark",
		-- 	})
		-- end
	},

	-- Spell check for pt_br
	{
		"mateusbraga/vim-spell-pt-br",
		commit = "3d7eb3098de77b86c8a880354b442b3d84b18a72"
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		commit = "258b5d899da7c681ce0e0225de32c593f3914c27",
		main = "ibl",
		opts = {},
		config = function()
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}
			local hooks = require "ibl.hooks"
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			end)

			--vim.g.rainbow_delimiters = { highlight = highlight }
			require("ibl").setup {
				scope = { highlight = highlight },
			}

			--hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		--tag = '0.1.1',
		commit = "87e92ea31b2b61d45ad044cf7b2d9b66dad2a618",

		-- or                            , branch = '0.1.x',
		dependencies = { { "nvim-lua/plenary.nvim", commit = "0c31c398261567cda89b66ddffc69d39495f63ae" } },
	},

	{
		"mbbill/undotree",
		commit = "1a23ea84bd02c34f50d8e10a8b4bfc89597ffe4e",
	},
	{
		"stevearc/conform.nvim",
		commit = "c0e0e80f0c233cb3a249f719a44324c660163a3f",
		opts = {},
	},

	-- formatter for use with csharpier
	{
		"sbdchd/neoformat",
		commit = "82864d6c7926c4f3b535a2fd7eab919b116fc969"
	},
	-- auto closing
	{
		"windwp/nvim-autopairs",
		commit = "ae5b41ce880a6d850055e262d6dfebd362bb276e",
	}, -- autoclose parens, brackets, quotes, etc...

	{
		"windwp/nvim-ts-autotag",
		commit = "531f48334c422222aebc888fd36e7d109cb354cd",
		dependencies = "nvim-treesitter",
	}, -- autoclose tags

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
			{
				"nvim-lua/plenary.nvim",
				commit = "0c31c398261567cda89b66ddffc69d39495f63ae",
			},
			{
				"Pocco81/TrueZen.nvim",
				commit = "a31109cd423121e1154ae0844fb312086428306f",
			},
			{
				"nvim-treesitter",
				commit = "b444afa1dacd3d031c0ffe4763671d89afda5ddb",
			},
		},
	},

	{
		"phaazon/mind.nvim",
		commit = "e59c52758c399caceb549c698cfa2d65e6bbb9f9",
		opts = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			commit = "0c31c398261567cda89b66ddffc69d39495f63ae",
		},
		config = function()
			require("mind").setup()
		end,
	},

	{
		"nvim-tree/nvim-web-devicons",
		commit = "bb6d4fd1e010300510172b173ab5205d37af084f",
	},

	{
		"nvim-tree/nvim-tree.lua",
		commit = "08a0aa1a3b7411ee0a7887c8818528b1558cef96",
	},

	{
		"akinsho/bufferline.nvim",
		commit = "84b0822b2af478d0b4f7b0f9249ca218855331db",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			commit = "bb6d4fd1e010300510172b173ab5205d37af084f",
		},
		--after = "catppuccin",
		-- config = function()
		--   local mocha = require("catppuccin.palettes").get_palette "mocha"
		--   require("bufferline").setup({
		--     highlights = require("catppuccin.groups.integrations.bufferline").get() {
		--       styles = { "italic", "bold" },
		--       custom = {
		--         all = {
		--         },
		--         mocha = {
		--           background = { fg = mocha.text },
		--         },
		--         latte = {
		--           background = { fg = "#000000" },
		--         },
		--       }
		--     }
		--   })
		-- end
	},

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

	{
		"folke/trouble.nvim",
		commit = "67337644e38144b444d026b0df2dc5fa0038930f",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			commit = "bb6d4fd1e010300510172b173ab5205d37af084f"
		},
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
		commit = "0c31c398261567cda89b66ddffc69d39495f63ae",
		lazy = true,
	},

	-- Editing
	{
		'karb94/neoscroll.nvim',
		commit = "4ecd20d9372e9ce3e2f11255b6f1e52171f3d13d",
		event = "VeryLazy",
		config = function()
			require('neoscroll').setup({})
		end
	},
	{
		'kevinhwang91/nvim-hlslens',
		commit = "3e8fceb2b030100857ee72741a8f48c9a1d8595e",
		event = "VeryLazy",
		config = function()
			require('hlslens').setup()

			vim.api.nvim_set_keymap('n', 'n',
				[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
				{ desc = "Next search result", silent = true })

			vim.api.nvim_set_keymap('n', 'N',
				[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
				{ desc = "Previous Search Result", silent = true })

			vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]],
				{ desc = 'Next Search Result Highlighted', silent = true })

			vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]],
				{ desc = "Previous Search Result Highlighted", silent = true })

			vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]],
				{ desc = "Mark Current Word And Search Forward", silent = true })

			vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]],
				{ desc = "Mark Current Workd and Search Backwards" })

			vim.api.nvim_set_keymap('n', '<Leader>n', '<Cmd>noh<CR>', { desc = "No HLS", silent = true })
		end

	},
	{
		'tpope/vim-surround',
		commit = "3d188ed2113431cf8dac77be61b842acb64433d9",
		event = "VeryLazy"
	},
	-- {
	-- 	'kosayoda/nvim-lightbulb',
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require('nvim-lightbulb').setup({
	-- 			autocmd = { enabled = true }
	-- 		})
	-- 	end
	-- },
	{
		'chentoast/marks.nvim',
		commit = "74e8d01b2a2131b6e46354cffc553aa7f81bcf5b",
		event = "VeryLazy",
		config = function()
			require('marks').setup({})
		end
	},
	{
		'HiPhish/nvim-ts-rainbow2',
		commit = "b3120cd5ae9ca524af9cb602f41e12e301fa985f",
		event = { "BufReadPre", "BufNewFile" },
		-- event = "VeryLazy",
		config = function()
			require('nvim-treesitter.configs').setup({
				rainbow = {
					enable = true,
					extended_mode = true,
				}
			})
		end
	},
	{
		"tzachar/local-highlight.nvim",
		commit = "ae3ada3a332128b1036c84c8587b9069891c63da",
		event = "VeryLazy",
		config = function()
			require('local-highlight').setup({
				insert_mode = true,
			})
		end
	},
	{
		"petertriho/nvim-scrollbar",
		commit = "35f99d559041c7c0eff3a41f9093581ceea534e8",
		event = "VeryLazy",
		config = function()
			require('scrollbar').setup({})
		end
	},

	{
		"xiyaowong/transparent.nvim",
		commit = "fd35a46f4b7c1b244249266bdcb2da3814f01724"
	},

	{
		'tpope/vim-repeat',
		commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a",
		event = "VeryLazy",
	},

	-- Session
	{
		'rmagatti/auto-session',
		commit = "9e0a169b6fce8791278abbd110717b921afe634d",
		config = function()
			require("auto-session").setup {
				log_level = "error",
				auto_session_suppress_dirs = { "~/Downloads", "/" },
			}
		end
	},

	-- Navigation
	{
		'smoka7/hop.nvim',
		commit = "059e88e9dcaad3280ea1fd5c757f6904f274aed5",
		version = "*",
		opts = {
			keys = 'etovxqpdygfblzhckisuran'
		}
	},

	{
		"folke/flash.nvim",
		commit = "48817af25f51c0590653bbc290866e4890fe1cbe",
		-- event = "VeryLazy",
		---@type Flash.Config
		opts = {
			modes = {
				char = {
					enabled = false,
				}
			}
		},
		-- stylua: ignore
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
			-- { "S", mode = { "n", "x", "o" }, function() require("flash").Treesitter() end, desc = "Flash Treesitter" },
		},
	},

	---[[ Comments
	{
		"numToStr/Comment.nvim",
		commit = "0236521ea582747b58869cb72f70ccfa967d2e89",
	},

	{
		-- Needs package `extra/ttf-jetbrains-mono-nerd` for icons to work
		"folke/todo-comments.nvim",
		commit = "077c59586d9d0726b0696dc5680eb863f4e04bc5",
		dependencies = {
			{
				"nvim-lua/plenary.nvim",
				commit = "0c31c398261567cda89b66ddffc69d39495f63ae",
			},
		},

		config = function()
			---@diagnostic disable-next-line: redundant-parameter
			require("config.todocomments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	--]]

	{
		"mfussenegger/nvim-dap",
		commit = "780fd4dd06b0744b235a520d71660c45279d9447",
		dependencies = {
			-- fancy UI for the debugger
			{
				"rcarriga/nvim-dap-ui",
				commit = "d845ebd798ad1cf30aa4abd4c4eff795cdcfdd4f",
				-- stylua: ignore
				keys = {
					{ "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
					{ "<leader>de", function() require("dapui").eval() end,     desc = "Eval",  mode = { "n", "v" } },
				},
				opts = {},
				config = function(_, opts)
					-- setup dap config by VsCode launch.json file
					-- require("dap.ext.vscode").load_launchjs()
					Dap = require("dap")
					local dapui = require("dapui")
					dapui.setup(opts)
					Dap.listeners.after.event_initialized["dapui_config"] = function()
						dapui.open({})
					end
					Dap.listeners.before.event_terminated["dapui_config"] = function()
						dapui.close({})
					end
					Dap.listeners.before.event_exited["dapui_config"] = function()
						dapui.close({})
					end
				end,
			},

			-- virtual text for the debugger
			{
				"theHamsta/nvim-dap-virtual-text",
				commit = "d4542ac257d3c7ee4131350db6179ae6340ce40b",
				opts = {},
			},

			-- which key integration
			{
				"folke/which-key.nvim",
				commit = "5224c261825263f46f6771f1b644cae33cd06995",
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
				commit = "3614a39aae98ccd34124b072939d6283853b3dd2",
				dependencies = {
					"mason.nvim",
					commit = "2311d9d883eb709ad9979a726a38c5ce1343b63c",
				},
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

		-- TODO: Maybe move into config.lsp.keymaps.lua
		-- stylua: ignore
		keys = {
			{ "<leader>dB", function() Dap.set_breakpoint(vim.f.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
			{ "<leader>db", function() Dap.toggle_breakpoint() end,                                   desc = "Toggle Breakpoint" },
			{ "<leader>dc", function() Dap.continue() end,                                            desc = "Continue" },
			---@diagnostic disable-next-line: undefined-global
			{ "<leader>da", function() Dap.continue({ before = get_args }) end,                       desc = "Run with Args" },
			{ "<leader>dC", function() Dap.run_to_cursor() end,                                       desc = "Run to Cursor" },
			{ "<leader>dg", function() Dap.goto_() end,                                               desc = "Go to line (no execute)" },
			{ "<leader>di", function() Dap.step_into() end,                                           desc = "Step Into" },
			{ "<leader>dj", function() Dap.down() end,                                                desc = "Down" },
			{ "<leader>dk", function() Dap.up() end,                                                  desc = "Up" },
			{ "<leader>dl", function() Dap.run_last() end,                                            desc = "Run Last" },
			{ "<leader>do", function() Dap.step_out() end,                                            desc = "Step Out" },
			{ "<leader>dO", function() Dap.step_over() end,                                           desc = "Step Over" },
			{ "<leader>dp", function() Dap.pause() end,                                               desc = "Pause" },
			{ "<leader>dr", function() Dap.repl.toggle() end,                                         desc = "Toggle REPL" },
			{ "<leader>ds", function() Dap.session() end,                                             desc = "Session" },
			{ "<leader>dt", function() Dap.terminate() end,                                           desc = "Terminate" },
			{ "<leader>dw", function() require("dap.ui.widgets").hover() end,                         desc = "Widgets" },
		},

		config = function()
			local Config = {
				-- colorscheme can be a string like `catppuccin` or a function that will load the colorscheme
				---@type string|fun()
				colorscheme = function()
					require("catppuccin").load()
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

	-- Git {{{
	{
		"lewis6991/gitsigns.nvim",
		commit = "2c2463dbd82eddd7dbab881c3a62cfbfbe3c67ae",
	},

	{
		"tpope/vim-fugitive",
		commit = "193ba9b393931bad768c1d2eed688b0bcc240858"
	},

	{
		"kdheepak/lazygit.nvim",
		commit = "18060f9841e7443e8a22af14e67c0ba86c6188d3",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
		}
	},

	{
		'pwntester/octo.nvim',
		commit = "feae1e5519deebad3c59ee1d57d28aa22822f7c8",
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ "nvim-telescope/telescope.nvim", commit = "87e92ea31b2b61d45ad044cf7b2d9b66dad2a618" },
			-- OR 'ibhagwan/fzf-lua',
			{ 'nvim-tree/nvim-web-devicons',   commit = "bb6d4fd1e010300510172b173ab5205d37af084f" },
		},
		config = function()
			require "octo".setup()
		end
	},
	-- }}}

	{
		"kosayoda/nvim-lightbulb",
		commit = "8f00b89dd1b1dbde16872bee5fbcee2e58c9b8e9",
	},

	{
		"github/copilot.vim",
		commit = "79e1a892ca9b4fa6234fd25f2930dba5201700bd",
	},

	{
		"epwalsh/obsidian.nvim",
		commit = "0458e675d5ea59ba8df5375bf04f2a5a57720af8",
	},

	{
		-- WARN: Não faz view para diagramas de classe
		"weirongxu/plantuml-previewer.vim",
		commit = "c0a9e42ad004b706ed3a097c839932110e75aae4",
	},

	{
		"tyru/open-browser.vim",
		commit = "7d4c1d8198e889d513a030b5a83faa07606bac27",
	},

	{
		"kristijanhusak/vim-dadbod-ui",
		commit = "165699c573469e6a95b48d35052f848c340c5911",
		dependencies = {
			{
				"tpope/vim-dadbod",
				commit = "9d3e3ce74a264642a41e8ae126be5afd095ef107",
				--lazy = true
			},
			{
				"kristijanhusak/vim-dadbod-completion",
				commit = "c920cb0ba3dff4b1b0ed373e1c0b3007dec696c2",
				ft = { "sql", "mysql", "plsql" },
				lazy = true,
			},
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},

	{
		"Exafunction/codeium.nvim",
		commit = "cd5913ff5481229b15186293d1d46dd9500789f9",
		dependencies = {
			{
				"nvim-lua/plenary.nvim",
				commit = "0c31c398261567cda89b66ddffc69d39495f63ae",
			},
			{
				"hrsh7th/nvim-cmp",
				commit = "feed47fd1da7a1bad2c7dca456ea19c8a5a9823a",
			},
		},
		config = function()
			require("codeium").setup({})
		end,
	},

	{
		"moll/vim-bbye",
		commit = "25ef93ac5a87526111f43e5110675032dbcacf56",
	},

	{
		"catppuccin/nvim",
		name = "catppuccin",
		commit = "9703f227bfab20d04bcee62d2f08f1795723b4ae",
		priority = 1000,
	},

	{
		'NvChad/nvim-colorizer.lua',
		commit = "85855b38011114929f4058efc97af1059ab3e41d"
	}


	--[[ ChatGPT
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
  --]]
}

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
