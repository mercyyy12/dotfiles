vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

local modes = { 'n', 'i', 'v', 'o', 't', 's', 'x' }
local arrows = { '<Up>', '<Down>', '<Left>', '<Right>' }
for _, mode in ipairs(modes) do
  for _, key in ipairs(arrows) do
    vim.keymap.set(mode, key, '<Nop>', { noremap = true, silent = true })
  end
end



-- Shortcut to run the current Go file
vim.keymap.set('n', '<leader>r', '<cmd>vsplit | term go run %<CR>', { desc = '[R]un current Go file' })

-- Window splits (looks like what it does!)
vim.keymap.set('n', '<leader>|', '<cmd>vsplit<CR>', { desc = 'Split window vertically' })
vim.keymap.set('n', '<leader>-', '<cmd>split<CR>',  { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>x', '<cmd>close<CR>',  { desc = 'Close current pane' })
