vim.pack.add({
    { src = 'https://github.com/Wansmer/langmapper.nvim' },
    { src = 'https://github.com/nvimtools/hydra.nvim' },
    { src = 'https://github.com/mg979/vim-visual-multi' },
    { src = 'https://github.com/m4xshen/autoclose.nvim' },
    { src = 'https://github.com/lewis6991/gitsigns.nvim' },
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/mhartington/formatter.nvim' },
    { src = "https://github.com/tpope/vim-fugitive" },
    { src = "https://github.com/sindrets/diffview.nvim" },
})

require('langmapper').automapping({ global = true, buffer = true })
require('autoclose').setup({})
require('gitsigns').setup({ signcolumn = false })
require('mason').setup({})
require('diffview').setup({})
require('formatter').setup({
    logging = true,
    log_level = vim.log.levels.WARN,
    filetype = {
        graphql = {
            require('formatters.graphql')
        },
        json = {
            require('formatters.json')
        },
        lua = {
            require('formatters.lua')
        },
        proto = {
            require('formatters.proto')
        },
        ts = {
            require('formatters.ts')
        },
        yaml = {
            require('formatters.yaml')
        },
        go = {
            require('formatters.go')
        },
        html = {
            require('formatters.html')
        },
        js = {
            require('formatters.js')
        },
        jsx = {
            require('formatters.jsx')
        },
        md = {
            require('formatters.md')
        },
        py = {
            require('formatters.py')
        },
        xml = {
            require('formatters.xml')
        },
        zsh = {
            require('formatters.zsh')
        },
        ['*'] = {
            require('formatters.any').remove_trailing_whitespace,
        }
    }
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
    group = "__formatter__",
    command = ":FormatWrite",
})
