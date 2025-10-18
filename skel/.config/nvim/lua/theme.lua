local vim = vim
local opt = vim.opt

vim.pack.add({
    { src = 'https://github.com/f4z3r/gruvbox-material.nvim' }
})

require('gruvbox-material').setup({})

opt.termguicolors = true

vim.o.background = 'dark'
vim.cmd.colorscheme('gruvbox-material')

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none', ctermbg = 'none' })
vim.api.nvim_set_hl(0, 'NonText', { fg = '#0a0a0a' })
vim.api.nvim_set_hl(0, 'Whitespace', { fg = '#0a0a0a' })
