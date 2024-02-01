local M = {}
M.general = {
  n = {
    ["<C-h>"] = {"<cmd> TmuxNavigateLeft<CR>", "window left"},
    ["<C-l>"] = {"<cmd> TmuxNavigateRight<CR>", "window right"},
    ["<C-j>"] = {"<cmd> TmuxNavigateDown<CR>", "window down"},
    ["<C-k>"] = {"<cmd> TmuxNavigateUp<CR>", "window up"},
    ["<A-,>"] = {"<cmd> bp<CR>", "Previous buffer"},
    ["<A-.>"] = {"<cmd> bn<CR>", "Next buffer"},
  }
}
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add a breakpoint at line"
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger"
    }
  }
}
M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

M.vimtex = {
  plugin = true,
  n = {
    ["<leader>lc"] = {
      "<cmd> VimtexCompile <CR>",
      "Compile the current latex document"
    }
  }
}

return M
