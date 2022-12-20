local handlers = require("configs.lsp.handlers")

require('lspconfig')['sumneko_lua'].setup {
  server = {
    capabilities = handlers.capabilities,
    on_attach = function(client, bufnr)
      handlers.on_attach(client, bufnr)
    end
  },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  }
}

