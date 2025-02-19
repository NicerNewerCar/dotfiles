local keymap = vim.api.nvim_set_keymap

-- Window movments
keymap('n', '<c-j>', '<c-w>j', {noremap = true, desc = "Move to window below current"})
keymap('n', '<c-h>', '<c-w>h', {noremap = true, desc = "Move to window left of current"})
keymap('n', '<c-k>', '<c-w>k', {noremap = true, desc = "Move to window above current"})
keymap('n', '<c-l>', '<c-w>l', {noremap = true, desc = "Move to window right of current"})

-- Telescope
keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", {noremap = true, desc = "Telescope find files" })
keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').live_grep()<cr>", {noremap = true, desc = "Telescope live grep"})
keymap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", {noremap = true, desc = "Telescope buffers"})
keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", {noremap = true, desc = "Telescope help tags"})

-- NvimTree
keymap('n', '<c-n>', ':NvimTreeToggle<CR>', {noremap = true, desc = "Toggle NvimTree"})

-- CMake
keymap('', '<leader>cg', ':CMakeGenerate<cr>', {desc = "CMake Generate"})
keymap('', '<leader>cb', ':CMakeBuild<cr>', {desc = "CMake Build"})
keymap('', '<leader>cq', ':CMakeClose<cr>', {desc = "CMake Close"})
keymap('', '<leader>cc', ':CMakeClean<cr>', {desc = "CMake Clean"})
