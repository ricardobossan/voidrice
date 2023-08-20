vim.g.mapleader = " "

local map = vim.keymap.set
local default_opts = { noremap = true, silent = true }

-- Generic
map("n", "<leader>e", ":NvimTreeToggle <CR>", default_opts)

-- Resizing panes
map("n", "<Left>", ":vertical resize +1<CR>", default_opts)
map("n", "<Right>", ":vertical resize -1<CR>", default_opts)
map("n", "<Up>", ":resize -1<CR>", default_opts)
map("n", "<Down>", ":resize +1<CR>", default_opts)

-- Escape to normal mode
map("i", "jk", "<ESC>", default_opts)
map("v", "jk", "<ESC>", default_opts)
map("t", "jk", "<C-\\><C-n>", default_opts)

-- Better indent
map("v", "<", "<gv", default_opts)
map("v", ">", ">gv", default_opts)

-- Deveria permitir copiar para outras janelas com y
map("n", "<leader>y", '"+y', default_opts)
map("v", "<leader>y", '"+y', default_opts)
map("n", "<leader>Y", '"+Y', default_opts)

-- Esc
map("i", "jk", "<Esc>", default_opts)

-- Save
map("n", "<leader>w", ":w<CR>", default_opts)
map("n", "<leader>wo", ":w<CR>:so<CR>", default_opts)
map("n", "<leader>wa", ":wall<CR>", default_opts)

-- Sair
map("n", "<leader>q", ":q<CR>", default_opts)

-- Format
map("n", "<leader>lf", function()
  vim.lsp.buf.format()
end)

-- Cria linhas sem entrar em insert
map("n", "o", "o<Esc>", default_opts)
map("n", "O", "O<Esc>", default_opts)

-- Buffers
map("n", "<S-l>", ":BufferLineCycleNext<CR>", default_opts)
map("n", "<S-h>", ":BufferLineCyclePrev<CR>", default_opts)
map("n", "<C-l>", ":BufferLineMoveNext<CR>", default_opts)
map("n", "<C-h>", ":BufferLineMovePrev<CR>", default_opts)
map("n", "<leader>b", ":BufferLineToggle<CR>", default_opts)
map("n", "<leader>b", ":BufferLineToggle<CR>", default_opts)

-- Lsp
map("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", default_opts)
map("n", "<leader>m", ":set syntax=markdown<CR>", default_opts)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", default_opts)
