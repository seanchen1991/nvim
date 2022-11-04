-- [[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- Toggle nvim-tree
map('n', '<leader>n', '<cmd>NvimTreeToggle<cr>', {})

-- Telescope keymaps 
map('n', '<leader>pf','<cmd>Telescope find_files theme=dropdown<cr>', {})
map('n', '<leader>/', '<cmd>Telescope live_grep<cr>', {})
map('n', '<leader>gd', '<cmd>Telescope lsp_definitions<cr>', {})
map('n', '<leader>gr', '<cmd>Telescope lsp_references<cr>', {})
map('n', '<leader>pp', '<cmd>Telescope projects<cr>', {})

-- Better commenting mappings
map('n', 'gc', '<cmd>CommentToggle<cr>', {})
map('v', 'gc', '<cmd>CommentToggle<cr>', {})

-- Map <C-w> to <leader><leader>
map('n', '<leader><leader>', '<C-w>', {})

-- Floaterm keymappings
map('n', '<leader>t', '<cmd>FloatermToggle myfloat<cr>', {})
map('t', '<Esc>', '<C-\\><C-n>:q<CR>', {})

-- Navigate buffers
map('n', '<S-l>', '<cmd>bnext<cr>', {})
map('n', '<S-h>', '<cmd>bprevious<cr>', {})

-- Toggle Glow markdown preview on the current buffer
map('n', '<leader>md', '<cmd>Glow<cr>', {})

-- Mappings for Hop
map('n', '<leader>3', '<cmd>HopWord<cr>', {})
map('n', '<leader>1', '<cmd>HopChar1<cr>', {})
map('n', '<leader>2', '<cmd>HopChar2<cr>', {})

-- Remap the :bdelete command for closing a buffer
map('n', '<leader>bd', '<cmd>bdelete<cr>', {})

-- Remap splitting a window to the right
map('n', '<leader>sl', '<C-w><C-v>', {})

-- Remap quit all loaded and open buffers, splits, and tabs
map('n', '<leader>qq', '<cmd>qall<cr>', {})
