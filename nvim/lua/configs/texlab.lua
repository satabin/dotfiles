local handlers = require("configs.lsp.handlers")

require('lspconfig')['texlab'].setup {
  server = {
    capabilities = handlers.capabilities,
    on_attach = function(client, bufnr)
      handlers.on_attach(client, bufnr)
    end,
  }
}
