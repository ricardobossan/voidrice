local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.foldmethod = "indent"

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = false

opt.smartindent = true

vim.opt.wrap = true

opt.swapfile = false
opt.backup = false

vim.opt.undofile = true
vim.opt.undolevels = 30000
opt.undodir = HOME .. "/vim/undodir"

opt.clipboard = "unnamedplus"

opt.confirm = true
opt.cursorline = true


vim.opt.spelllang = { "en", "pt_br" }

opt.wildmode = "longest:full,full"

opt.shortmess:append("a")

opt.pumblend = 10  -- Popup menu transparency
opt.pumheight = 10 -- Popup menu height
opt.winblend = 10  -- Window transparency

vim.opt.mouse = "a" -- Enable mouse mode

opt.formatoptions:remove("cro")

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

--opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

vim.g.mapleader = " "
