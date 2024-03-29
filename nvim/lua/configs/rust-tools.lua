local handlers = require("configs.lsp.handlers")
local opts = {
  tools = {
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      show_parameter_hints = false,
      parameter_hints_prefix = "",
      other_hints_prefix = "",
    },
  },
  server = {
    capabilities = handlers.capabilities,
    on_attach = function(client, bufnr)
      handlers.on_attach(client, bufnr)
    end,
    settings = {
      ['rust-analyzer'] = {
        lens = {
          enable = true,
        },
        procMacro = {
          enable = true,
        },
        inlayHints = {
          lifetimeElisionHints = {
            enable = "always",
            useParameterNames = false
          },
          reborrowHints = {
            enable = "always"
          },
          bindingModeHints = {
            enable = false,
          },
          chainingHints = {
            enable = false,
          },
          closingBraceHints = {
            enable = false,
            minLines = 25
          },
          closureReturnTypeHints = {
            enable = "never",
            maxLength = 25
          },
          parameterHints = {
            enable = false
          },
          renderColons = true,
          typeHints = {
            enable = false,
            hideClosureInitialization = false,
            hideNamedConstructor = false
          },
        },
        checkOnSave = {
          allTargets = false,
          command = "clippy"
        },
      },
    },
  },
}

require("rust-tools").setup(opts)
