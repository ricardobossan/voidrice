local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.foldmethod = "indent"

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true

vim.opt.wrap = true

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/vim/undodir"

vim.opt.spelllang = { "en", "pt_br"}
opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

--opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

vim.g.mapleader = " "
