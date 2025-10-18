local opt = vim.opt

vim.g.mouse = 'a'

opt.termguicolors = true
opt.encoding = 'utf-8'
opt.fileformat = 'unix'
opt.number = true
opt.relativenumber = false
opt.numberwidth = 2
opt.autoindent = true
opt.cmdheight = 1
opt.confirm = true
opt.signcolumn = 'yes:1'
opt.ignorecase = true
opt.swapfile = false
opt.autoindent = true
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.shiftround = true
opt.listchars = "tab:-->,lead:·,space:·,trail:~"
opt.matchpairs = '{:},[:],(:),<:>,":",\':\''
opt.list = true
opt.wrap = false
opt.cursorline = true
opt.scrolloff = 8
opt.inccommand = "nosplit"
opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
opt.undofile = true
opt.completeopt = { "menuone", "popup", "noinsert" }
opt.winborder = "rounded"
opt.hlsearch = false

vim.cmd.filetype("plugin indent on")

