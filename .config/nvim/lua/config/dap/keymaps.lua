--[[
TODO: Olha decisão em `ric` e aplica aqui e onde couber.
--]]

local M = {}

local plantuml = require("config.plantuml")

require('telescope').setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--hidden",
			"--smart-case",
		},
	},
})

local builtin = require("telescope.builtin")
local whichkey = require("which-key")
local legendary = require("legendary")
local legendary_whichkey = require("legendary.integrations.which-key")

-- TODO: Move all unrelated to dap from here to more neutral location
function M.setup()
	-- Utils {{{
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

	function toggle_doing()
		local line = vim.fn.line('.')
		local line_content = vim.fn.getline(line)
		local pattern = "%s*<!%-%- DOING: %-%->%s*$"
		local found = string.find(line_content, pattern)

		if found then
			-- Remove the string if found
			local new_content = string.gsub(line_content, pattern, '')
			vim.fn.setline(line, new_content)
		else
			-- Add the string at the end of the line if not found
			vim.fn.setline(line, line_content .. ' <!-- DOING: -->')
		end
	end

	-- }}}

	-- Options {{{
	local opts_no_leader = { buffer = bufnr, prefix = "" }

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
		---@diagnostic disable-next-line: undefined-global
		buffer = bufnr,
		silent = true,
		noremap = true,
		nowait = false,
	}

	-- optsX -- ext commands?
	-- }}}

	-- Mappings {{{
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
	-- }}}

	-- Keymaps {{{
	local keymap_g = {
		name = "Get",
		g = g_maps,
	}

	local keymapV = {
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
				m = { "<cmd>ObsidianToday +1<CR>", "Tomorrow" },
				M = { "<cmd>ObsidianTomorrow<CR>", "Tomorrow (weekday)" },
				n = { "<cmd>ObsidianNew<CR>", "New" },
				y = { "<cmd>ObsidianToday -1<CR>", "Yesterday" },
				Y = { "<cmd>ObsidianYesterday<CR>", "Yesterday (weekday)" },
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

	-- Keymaps (keymapX) -- ext commands?

	local keymap = {
		B = { "<cmd>TransparentToggle<CR>", "Transparency Toggle" },
		b = {
			name = "Buffers",
			["b"] = {
				"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
				"Buffers",
			},
			["d"] = { "<cmd>bdelete!<CR>", "Close Buffer" },
		},
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
		e = { "<cmd>NvimTreeFindFileToggle<cr>", "Explorer" },
		f = {
			name = "Find",
			["f"] = { "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", "Files" },
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
		G = {
			name = "Git",
			g = { "<cmd>LazyGit<cr>", "Lazygit" },
			a = {
				name = "Add",
				a = { "<cmd>Git add .<cr>", "All" },
				b = { "<cmd>Git add %<cr>", "Buffer" },
				h = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Hunk" },
			},
			B = {
				name = "Blame",
				b = { "<cmd>Git blame<cr>", "Buffer" },
				l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Line" },
			},
			b = {
				name = "Branch",
				b = { "<cmd>Telescope git_branches<cr>", "List" },
				d = { "<cmd>Git branch -d<cr>", "Delete" },
				D = { "<cmd>Git branch -D<cr>", "Force Delete" },
				r = { "<cmd>Git branch -r<cr>", "Remote" },
				R = { "<cmd>Git branch -vv<cr>", "Remote Verbose" },
			},
			c = {
				name = "Checkout",
				b = { "<cmd>Telescope git_branches<cr>", "to Branch" },
				c = { "<cmd>Telescope git_commits<cr>", "to Commit" },
				R = { "<cmd>Git checkout .<cr>", "( ⚠️  Dangerous! )  Remove all uncommited changes" },
				r = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Remove unstaged changes in this buffer" },
			},
			C = {
				name = "Commit",
				c = { "<cmd>Git commit<cr>", "Commit" },
				--a = { "<cmd>Git commit --amend<cr>", "Amend" },
				--A = { "<cmd>Git commit --amend --no-edit<cr>", "Amend (No Edit)" },
				e = { "<cmd>Telescope git_commits<cr>", "List" },
				--p = { "<cmd>Git commit --patch<cr>", "Patch" },
				--P = { "<cmd>Git commit --patch --amend<cr>", "Patch Amend" },
				--r = { "<cmd>Git commit --reword<cr>", "Reword" },
				s = { "<cmd>Git commit --squash<cr>", "Squash" },
				--S = { "<cmd>Git commit --squash --amend<cr>", "Squash Amend" },
			},
			d = { "<cmd>lua require 'gitsigns'.diffthis()<cr>", "Diff this file" }, -- Gitsigns
			D = {
				name = "Diff options",
				f = { "<cmd>lua require 'gitsigns'.diffthis()<cr>", "Diff this file" }, -- Gitsigns
				--b = { "<cmd>Gvdiff<cr>", "Buffer" }, -- Less precise
				d = { "<cmd>Git diff<cr>", "Diff" },
				h = { "<cmd>Git diff HEAD<cr>", "Diff HEAD" },
				--h = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Hunk" },
			},
			-- TODO: Think about hung navigation and keybinding. Look DevOps Toolbox config
			h = {
				name = "Hunk",
				d = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Diff" },
				n = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next" },
				p = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev" },
				s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage" },
				u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo" },
				r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset" },
			},
			l = { "<cmd>Telescope git_status<cr>", "Changed files" },
			L = {
				name = "Log",
				a = { "<cmd>Git log --all --graph --oneline --decorate<cr>", "All (Oneline)" },
				A = { "<cmd>Git log --all --graph --decorate<cr>", "All (Verbose)" },
				b = { "<cmd>Git log --graph --oneline --decorate<cr>", "Branch (Oneline)" },
				B = { "<cmd>Git log --graph --decorate<cr>", "Branch (Verbose)" },
				c = { "<cmd>Telescope git_commits<cr>", "Commits" },
			},
			r = {
				name = "Reset",
				h = { "Git reset HEAD<cr>", "All to HEAD" },
			},
			s = { "<cmd>Git<cr>", "Status" },
		},
		g = g_maps,
		H = { builtin.help_tags, "Help (Vimtutor)" },
		L = {
			name = "Lazy",
			l = { "<cmd>Lazy<CR>", "Home" },
			s = { "<cmd>Lazy<CR>", "Sync" },
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
		m = {
			name = "Markdown",
			P = { "<cmd>MarkdownPreviewToggle<CR>", "Preview on Browser (Toggle)" },
			p = { "<cmd>Glow<CR>", "Preview on editor" },
			c = { "<cmd>MkdnTableNewColAfter<CR>", "+ Column after" },
			C = { "<cmd>MkdnTableNewColBefore<CR>", "+ Column before" },
			r = { "<cmd>MkdnTableNewRowBelow<CR>", "+ Row below" },
			R = { "<cmd>MkdnTableNewRowAbove<CR>", "+ Row above" },
			t = { "<cmd>InsertToc<CR>", "Insert TOC" },
			T = { "<cmd>InsertNToc<CR>", "Insert TOC (numbered)" },
		},
		O = {
			name = "Octo",
			i = {
				name = "+Issue",
				c = { "<cmd>Octo issue close<CR>", "Close the current issue" },
				r = { "<cmd>Octo issue reopen<CR>", "Reopen the current issue" },
				["c "] = { "<cmd>Octo issue create [repo]<CR>", "Creates a new issue in the current or specified repo" },
				["e "] = { "<cmd>Octo issue edit [repo]<CR>", "Edit issue <number> in current or specified repo" },
				["l "] = { "<cmd>Octo issue list [repo] [key=value] (1)<CR>", "List all issues satisfying given filter" },
				s = { "<cmd>Octo issue search<CR>", "Live issue search" },
				R = { "<cmd>Octo issue reload<CR>", "Reload issue. Same as doing e!" },
				b = { "<cmd>Octo issue browser<CR>", "Open current issue in the browser" },
				u = { "<cmd>Octo issue url<CR>", "Copies the URL of the current issue to the system clipboard" },
			},
			p = {
				name = "+Pull Request",
				l = { "<cmd>Octo pr list [repo] [key=value] (2)<CR>", "List all PRs satisfying given filter" },
				s = { "<cmd>Octo pr search<CR>", "Live issue search" },
				["e "] = { "<cmd>Octo pr edit [repo]<CR>", "Edit PR <number> in current or specified repo" },
				r = { "<cmd>Octo pr reopen<CR>", "Reopen the current PR" },
				c = { "<cmd>Octo pr create<CR>", "Creates a new PR for the current branch" },
				C = { "<cmd>Octo pr close<CR>", "Close the current PR" },
				o = { "<cmd>Octo pr checkout<CR>", "Checkout PR" },
				m = { "<cmd>Octo pr commits<CR>", "List all PR commits" },
				["h "] = { "<cmd>Octo pr changes<CR>", "Show all PR changes (diff hunks)" },
				d = { "<cmd>Octo pr diff<CR>", "Show PR diff" },
				M = { "<cmd>Octo pr merge [commit|rebase|squash] [delete]<CR>", "Merge current PR using the specified method" },
				R = { "<cmd>Octo pr ready<CR>", "Mark a draft PR as ready for review" },
				D = { "<cmd>Octo pr draft<CR>", "Send a ready PR back to draft" },
				k = { "<cmd>Octo pr checks<CR>", "Show the status of all checks run on the PR" },
				["r "] = { "<cmd>Octo pr reload<CR>", "Reload PR. Same as doing e!" },
				b = { "<cmd>Octo pr browser<CR>", "Open current PR in the browser" },
				u = { "<cmd>Octo pr url<CR>", "Copies the URL of the current PR to the system clipboard" },
			},
			R = {
				name = "+Repository",
				l = { "<cmd>Octo repo list (3)<CR>", "List repos user owns, contributes or belong to" },
				f = { "<cmd>Octo repo fork<CR>", "Fork repo" },
				b = { "<cmd>Octo repo browser<CR>", "Open current repo in the browser" },
				u = { "<cmd>Octo repo url<CR>", "Copies the URL of the current repo to the system clipboard" },
				v = { "<cmd>Octo repo view<CR>", "Open a repo by path ({organization}/{name})" },
			},
			g = {
				name = "+Gist",
				l = { "<cmd>Octo gist list [repo] [key=value] (4)<CR>", "List user gists" },
			},
			c = {
				name = "+Comment",
				a = { "<cmd>Octo comment add<CR>", "Add a new comment" },
				d = { "<cmd>Octo comment delete<CR>", "Delete a comment" },
			},
			t = {
				name = "+Thread",
				r = { "<cmd>Octo thread resolve<CR>", "Mark a review thread as resolved" },
				u = { "<cmd>Octo thread unresolve<CR>", "Mark a review thread as unresolved" },
			},
			l = {
				name = "+Label",
				a = { "<cmd>Octo label add [label]<CR>", "Add a label from available label menu" },
				r = { "<cmd>Octo label remove [label]<CR>", "Remove a label" },
				c = { "<cmd>Octo label create [label]<CR>", "Create a new label" },
			},
			A = {
				name = "+Assignee",
				a = { "<cmd>Octo assignee add [login]<CR>", "Assign a user" },
				r = { "<cmd>Octo assignee remove [login]<CR>", "Unassign a user" },
			},
			e = {
				name = "+Reviewer",
				a = { "<cmd>Octo reviewer add [login]<CR>", "Assign a PR reviewer" },
			},
			n = {
				name = "+Reaction",
				u = { "<cmd>Octo reaction thumbs_up | +1<CR>", "Add ?? reaction" },
				d = { "<cmd>Octo reaction thumbs_down | -1<CR>", "Add ?? reaction" },
				e = { "<cmd>Octo reaction eyes<CR>", "Add ?? reaction" },
				l = { "<cmd>Octo reaction laugh<CR>", "Add ?? reaction" },
				c = { "<cmd>Octo reaction confused<CR>", "Add ?? reaction" },
				r = { "<cmd>Octo reaction rocket<CR>", "Add ?? reaction" },
				h = { "<cmd>Octo reaction heart<CR>", "Add ?? reaction" },
				y = { "<cmd>Octo reaction hooray | party | tada<CR>", "Add ?? reaction" },
			},
			d = {
				name = "+Card",
				a = { "<cmd>Octo card add<CR>", "Assign issue/PR to a project new card" },
				r = { "<cmd>Octo card remove<CR>", "Delete project card" },
				m = { "<cmd>Octo card move<CR>", "Move project card to different project/column" },
			},
			r = {
				name = "+Review",
				s = { "<cmd>Octo review start<CR>", "Start a new review" },
				u = { "<cmd>Octo review submit<CR>", "Submit the review" },
				r = { "<cmd>Octo review resume<CR>", "Edit a pending review for current PR" },
				d = { "<cmd>Octo review discard<CR>", "Deletes a pending review for current PR if any" },
				o = { "<cmd>Octo review comments<CR>", "View pending review comments" },
				c = { "<cmd>Octo review commit<CR>", "Pick a specific commit to review" },
				C = { "<cmd>Octo review close<CR>", "Close the review window and return to the PR" },
			},
			a = { "<cmd>Octo actions <CR>", "Lists all available Octo actions" },
			s = { "<cmd>Octo search <CR>", "Search GitHub for issues and PRs matching the query" },
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
				m = { "<cmd>ObsidianToday +1<CR>", "Tomorrow" },
				M = { "<cmd>ObsidianTomorrow<CR>", "Tomorrow (weekday)" },
				n = { "<cmd>ObsidianNew<CR>", "New" },
				y = { "<cmd>ObsidianToday -1<CR>", "Yesterday" },
				Y = { "<cmd>ObsidianYesterday<CR>", "Yesterday (weekday)" },
			},
			q = { "<cmd>ObsidianQuickSwitch<CR>", "Switch between notes" },
			s = {
				name = "Search",
				n = { "<cmd>ObsidianSearch<CR>", "Search all notes" },
				t = { "<cmd>ObsidianTags<CR>", "Search tags" },
				l = { "<cmd>ObsidianLinks<CR>", "Search links for current note" },
			},
		},
		q = { "<cmd>q!<CR>", "Quit" },
		n = {
			name = "Navigate",
			h = { "<cmd>HopWord<CR>", "Hop Word" },
			f = { "<cmd>lua require('flash').jump()<CR>", "Flash" },
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
		T = { "<cmd>ToggleTerm direction=float<cr>", "Terminal" },
		t = {
			name = "TODO",
			T = { "<cmd>TodoTrouble<CR>", "Todo" },
			t = { "<cmd>lua toggle_doing()<CR>", "Toggle Doing" },
		},
		U = {
			name = "Plantuml",
			p = { "<cmd>PlantumlOpen<CR>", "Preview UML" },
			f = { plantuml.plantumlOutputSingle, "Print current file" },
			w = { plantuml.plantumlOutputAll, "Print all files in workspace" },
		},
		w = { "<cmd>w!<CR>", "Save" },
	}
	-- }}}

	-- NOTE: First all whichkey.register(), then legendary.setup() {{{
	whichkey.register(keymap, opts)
	legendary_whichkey.bind_whichkey(keymap, opts, true)
	legendary_whichkey.parse_whichkey(keymap, opts, true)

	whichkey.register(keymap_g, opts_no_leader)
	legendary_whichkey.bind_whichkey(keymap_g, opts_no_leader, true)
	legendary_whichkey.parse_whichkey(keymap_g, opts_no_leader, true)

	whichkey.register(keymapV, optsV)
	legendary_whichkey.bind_whichkey(keymapV, optsV, true)
	legendary_whichkey.parse_whichkey(keymapV, optsV, true)

	legendary.setup({ which_key = { auto_register = true } })
	-- }}}
end

--vim.api.nvim_set_keymap("n", "<Leader>gu", "<cmd>lua Open_browser_with_url()<CR>", { noremap = true, silent = true })

return M
