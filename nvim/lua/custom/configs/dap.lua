local dap = require('dap')
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = '/home/aj/.local/share/nvim/mason/packages/codelldb/codelldb',
    args = {"--port", "${port}"},
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    require('dap.ext.vscode').load_launchjs(nil, { cppdbg = {'c', 'cpp'} }),
    args = function()
      local args_str = vim.fn.input("Arguments(space seperated): ")
      if args_str == '' then
        return {}
      end
      return vim.split(args_str, " ")
    end,
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
  },
}
-- dap.configurations.c = dap.configurations.cpp
-- dap.configurations.rust = dap.configurations.cpp
