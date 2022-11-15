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
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    settings = {
      ['rust-analyzer'] = {
        lens = {
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
