local kb = require('kaz.utils.kb')
local window = require('kaz.utils.window')
local qf = require('kaz.utils.qf')
local github = require('kaz.utils.github')
local filename = require('kaz.utils.filename')

vim.g.mapleader = ' '

kb.map_missing('n', 'Q', 'q', kb.noremap)
kb.map_missing('n', '<S-l>', ':bn<CR>', kb.silent_noremap)
kb.map_missing('n', '<S-h>', ':bp<CR>', kb.silent_noremap)

vim.keymap.set('', 'Y', 'y$')
vim.keymap.set('v', 'Y', '"*y')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', '<leader>n', '<CMD>noh<CR>', { silent = true })
vim.keymap.set('n', '<leader>p', '<CMD>set paste!<CR>')
vim.keymap.set('n', '<C-]>', '<C-^>')
vim.keymap.set('n', 'gV', '`[v`]')
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set('n', '<C-e>', '3<C-e>')
vim.keymap.set('n', '<C-y>', '3<C-y>')
vim.keymap.set('x', '*', ":<C-u>lua require('kaz.utils.visual_star').star()<CR>/<C-R>=@/<CR><CR>")
vim.keymap.set('x', '<leader>rs', ":<C-u>lua require('kaz.utils.visual_star').star()<CR>/<C-R>=@/<CR><CR>Ncgn")
vim.keymap.set('n', '<leader>rs', '*Ncgn')
vim.keymap.set('n', 'k', [[(v:count > 1 ? "m'" . v:count : '') . 'k']], { expr = true })
vim.keymap.set('n', 'j', [[(v:count > 1 ? "m'" . v:count : '') . 'j']], { expr = true })

vim.keymap.set('n', '<M-k>', function()
  window.resize('up', 2)
end)
vim.keymap.set('n', '<M-j>', function()
  window.resize('down', 2)
end)
vim.keymap.set('n', '<M-l>', function()
  window.resize('right', 2)
end)
vim.keymap.set('n', '<M-h>', function()
  window.resize('left', 2)
end)
vim.keymap.set('n', '<leader>dd', function()
  qf.toggle_qf()
end)

vim.keymap.set('n', '<leader>go', function()
  github.current_file(nil, true)
end)
vim.keymap.set('n', '<leader>gb', function()
  local branch = vim.fn.input('Branch: ', '')
  github.current_file(branch, false)
end)
vim.keymap.set('n', '<leader>gc', function()
  filename.copy()
end)
vim.keymap.set('n', '<leader>gc', function()
  filename.copy(true)
end)
