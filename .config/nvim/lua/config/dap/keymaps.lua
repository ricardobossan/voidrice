local M = {}

local plantuml = require("config.plantuml")
local builtin = require("telescope.builtin")
local whichkey = require("which-key")
local legendary = require("legendary")
local legendary_whichkey = require("legendary.integrations.which-key")

local g_maps = {
	f = { "gf", "File" },
	u = { "<cmd>lua Open_browser_with_url()<CR>", "Url under cursor" },
	d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
	D = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
	h = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
	I = { "<cmd>Telescope lsp_implementations<CR>", "Implementation" },
	b = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	R = { "<cmd>lua require('telescope.builtin').lsp_references()<CR>", "References (Telescope)" },
}

local keymap_g = {
	name = "Get",
	g = g_maps,
}

-- TODO: Move all unrelated to dap to .config.lsp.keymaps.lua
function M.setup()
	local keymap = {
		["e"] = { "<cmd>NvimTreeFindFileToggle<cr>", "Explorer" },
		["m"] = {
			name = "Markdown",
			p = { "<cmd>MarkdownPreviewToggle<CR>", "Preview toggle" },
			c = { "<cmd>MkdnTableNewColAfter<CR>", "+ Column after" },
			C = { "<cmd>MkdnTableNewColBefore<CR>", "+ Column before" },
			r = { "<cmd>MkdnTableNewRowBelow<CR>", "+ Row below" },
			R = { "<cmd>MkdnTableNewRowAbove<CR>", "+ Row above" },
			t = { "<cmd>InsertToc<CR>", "Insert TOC" },
			T = { "<cmd>InsertNToc<CR>", "Insert TOC (numbered)" },
		},
		["w"] = { "<cmd>w!<CR>", "Save" },
		["q"] = { "<cmd>q!<CR>", "Quit" },
		--["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
		--["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
		--["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
		["h"] = { builtin.help_tags, "Help (Vimtutor)" },
		["O"] = { "<cmd>only<CR>", "Only" },
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
		L = {
			name = "Lazy",
			l = { "<cmd>Lazy<CR>", "Home" },
			s = { "<cmd>Lazy<CR>", "Sync" },
		},
		g = g_maps,
		-- p = {
		-- 	name = "Packer",
		-- 	c = { "<cmd>PackerCompile<cr>", "Compile" },
		-- 	i = { "<cmd>PackerInstall<cr>", "Install" },
		-- 	s = { "<cmd>PackerSync<cr>", "Sync" },
		-- 	S = { "<cmd>PackerStatus<cr>", "Status" },
		-- 	u = { "<cmd>PackerUpdate<cr>", "Update" },
		-- },
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
			--d = { "<cmd>lua require('telescope.builtin').diagnostics()<CR>", "Diagnostics" },
			d = {
				"<cmd>lua vim.diagnostic.setloclist()<cr>",
				"Document Diagnostics",
			},
			w = {
				"<cmd>Trouble workspace_diagnostics<cr>",
				"Workspace Diagnostics",
			},
			f = {
				function()
					---@diagnostic disable-next-line: unused-local
					local status, result = pcall(vim.lsp.buf.format, { async = true })
					if result == nil then
						require("conform").format()
						print(" ")
					end
				end,
				"Format",
			},
			j = {
				"<cmd>lua vim.diagnostic.goto_next()<CR>",
				"Next Diagnostic",
			},
			s = { "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>", "Document Symbols" },
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
		o = {
			name = "Obsidian",
			t = { "<cmd>ObsidianTemplate<CR>", "Insert Template" },
			w = { "<cmd>ObsidianWorkspace<CR>", "Select Workspace" },
			l = {
				name = "Link",
				e = { "<cmd>ObsidianLink<CR>", "Add existing" },
				g = { "<cmd>ObsidianFollowLink<CR>", "Follow" },
				l = { "<cmd>ObsidianLinks<CR>", "Search all for current note" },
				b = { "<cmd>ObsidianBacklinks<CR>", "See backlinks for note" },
				n = { "<cmd>ObsidianLinkNew<CR>", "Add New" },
			},
			n = {
				name = "Note",
				d = { "<cmd>ObsidianToday<CR>", "Today" },
				o = { "<cmd>ObsidianOpen<CR>", "Open" },
				m = { "<cmd>ObsidianTomorrow<CR>", "Tomorrow" },
				n = { "<cmd>ObsidianNew<CR>", "New" },
				y = { "<cmd>ObsidianYesterday<CR>", "Yesterday" },
			},
			q = { "<cmd>ObsidianQuickSwitch<CR>", "Switch between notes" },
			s = {
        name = "Search",
				n = { "<cmd>ObsidianSearch<CR>", "Search all notes" },
				t = { "<cmd>ObsidianTags<CR>", "Search tags" },
				l = { "<cmd>ObsidianLinks<CR>", "Search links for current note" },
			},
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

		t = { "<cmd>TodoTrouble<CR>", "Todo" },
		d = {
			name = "DAP",
			R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
			E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
			C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
			U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
			--b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
			c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
			d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
			e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
			g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
			h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
			S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
			i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
			o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
			p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
			q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
			r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
			s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
			b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
			x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
			u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
		},
	}

	local keymapV = {
		o = {
			name = "Obsidian",
			t = { "<cmd>ObsidianTemplate<CR>", "Insert Template" },
			w = { "<cmd>ObsidianWorkspace<CR>", "Select Workspace" },
			l = {
				name = "Link",
				e = { "<cmd>ObsidianLink<CR>", "Add existing" },
				g = { "<cmd>ObsidianFollowLink<CR>", "Follow" },
				l = { "<cmd>ObsidianLinks<CR>", "Search all for current note" },
				b = { "<cmd>ObsidianBacklinks<CR>", "See backlinks for note" },
				n = { "<cmd>ObsidianLinkNew<CR>", "Add New" },
			},
			n = {
				name = "Note",
				d = { "<cmd>ObsidianToday<CR>", "Today" },
				o = { "<cmd>ObsidianOpen<CR>", "Open" },
				m = { "<cmd>ObsidianTomorrow<CR>", "Tomorrow" },
				n = { "<cmd>ObsidianNew<CR>", "New" },
				y = { "<cmd>ObsidianYesterday<CR>", "Yesterday" },
			},
			q = { "<cmd>ObsidianQuickSwitch<CR>", "Switch between notes" },
			s = {
        name = "Search",
				n = { "<cmd>ObsidianSearch<CR>", "Search all notes" },
				t = { "<cmd>ObsidianTags<CR>", "Search tags" },
				l = { "<cmd>ObsidianLinks<CR>", "Search links for current note" },
			},
		},
	}

	local opts = {
		mode = "n",
		prefix = "<leader>",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = false,
	}

	local optsV = {
		mode = "v",
		prefix = "<leader>",
		buffer = bufnr,
		silent = true,
		noremap = true,
		nowait = false,
	}

	local opts_no_leader = { buffer = bufnr, prefix = "" }

	legendary.setup({ which_key = { auto_register = true } })

	whichkey.register(keymap, opts)
	legendary_whichkey.bind_whichkey(keymap, opts, true)
	legendary_whichkey.parse_whichkey(keymap, opts, true)

	whichkey.register(keymap_g, opts_no_leader)
	legendary_whichkey.bind_whichkey(keymap_g, opts_no_leader, true)
	legendary_whichkey.parse_whichkey(keymap_g, opts_no_leader, true)

	whichkey.register(keymapV, optsV)
	legendary_whichkey.bind_whichkey(keymapV, optsV, true)
	legendary_whichkey.parse_whichkey(keymapV, optsV, true)
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

function Open_browser_with_url()
	-- Get the word under the cursor
	local word = vim.fn.expand("<cWORD>")

	word = word:gsub("^[%[%]%(%)<>]+", "") -- Remove characters at the beginning
	word = word:gsub("[%[%]%(%)<>]+$", "") -- Remove characters at the end

	print("word: " .. word)

	-- Check if the word looks like a URL
	local url = word:match("(%S+)") -- Extract the non-whitespace part

	if url and string.match(url, "^https?://%S+") ~= nil then
		-- Execute the OpenBrowser command with the URL
		vim.cmd("OpenBrowser " .. url)
	else
		print("No URL under the cursor")
	end
end

--vim.api.nvim_set_keymap("n", "<Leader>gu", "<cmd>lua Open_browser_with_url()<CR>", { noremap = true, silent = true })

return M
