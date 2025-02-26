local configs = require'nvim-treesitter.configs'
configs.setup {
ensure_installed = "all", -- Only use parsers that are maintained
highlight = { -- enable highlighting
  enable = true, 
},
indent = {
  enable = true, -- default is disabled anyways
}
}
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
