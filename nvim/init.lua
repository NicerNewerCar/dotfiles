vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

vim.wo.number = true
vim.wo.relativenumber = true

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tomasr/molokai'
  use 'nvim-treesitter/nvim-treesitter'
  use { 
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.opts)
      local startify = require("alpha.themes.startify")
      startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
      startify.section.bottom_buttons.val = {
        startify.button("e", "new file", ":ene <bar> startinsert <cr>"),
        startify.button("v", "neovim config", ":e ~/.config/nvim/init.lua<cr>"),
        startify.button("q", "quit nvim", ":qa<cr>"),
      }  
      vim.api.nvim_set_keymap('n', '<c-s>', ':Alpha<cr>', {noremap = true})
    end
  }
  use {
    'neoclide/coc.nvim',
    branch = "release"
  }
  use 'kyazdani42/nvim-tree.lua'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use { 'folke/which-key.nvim', 
    config = function()
      require('which-key').setup({
        delay = 3000,
      })
    end,
  }
  use 'cdelledonne/vim-cmake'
end)

vim.g.colors_name = 'molokai'

require("keymaps")
require("treesitter")
require("coc")
require("nvimtree")
