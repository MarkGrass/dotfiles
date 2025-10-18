local keymap = vim.keymap.set
local s = { silent = true }

vim.g.mapleader = "`"

keymap("n", "<space>", "<Nop>")

keymap("n", "j", function()
    return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "j" or "gj"
end, { expr = true, silent = true })
keymap("n", "k", function()
    return tonumber(vim.api.nvim_get_vvar("count")) > 0 and "k" or "gk"
end, { expr = true, silent = true })
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<Leader>w", "<cmd>w!<CR>", s)
keymap("n", "<Leader>q", "<cmd>q<CR>", s)
keymap("n", "<Leader>te", "<cmd>tabnew<CR>", s)
keymap("n", "<Leader>_", "<cmd>vsplit<CR>", s)
keymap("n", "<Leader>-", "<cmd>split<CR>", s)
keymap("n", "<Leader>fo", ":lua vim.lsp.buf.format()<CR>", s)
keymap("v", "<Leader>p", '"_dP')
keymap("x", "y", [["+y]], s)
keymap("t", "<Esc>", "<C-\\><C-N>")

keymap("n", "<leader>cd", '<cmd>lua vim.fn.chdir(vim.fn.expand("%:p:h"))<CR>')

local opts = { noremap = true, silent = true }
keymap("n", "grd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

keymap('n', '<Leader>f', ':Format<CR>', { silent = true })
keymap('n', '<Leader>F', ':FormatWrite<CR>', { silent = true })

keymap("n", "<leader>gs", '<cmd>Git<CR>', opts)
keymap("n", "<leader>gp", '<cmd>Git push<CR>', opts)
