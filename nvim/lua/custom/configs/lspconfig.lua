local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {
  on_attach = function(client, bufn)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufn)
  end,
  capabilities = capabilities
}

lspconfig.pylsp.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})

lspconfig.texlab.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"latex"}
})
