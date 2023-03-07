require("configs.lsp.handlers").setup()
require("configs.lsp.autocmds")
require("lsp-inlayhints").setup({})

-- global
vim.opt_global.completeopt = { "menu", "noinsert", "noselect" }

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    require("lsp-inlayhints").on_attach(client, args.buf, false)
  end,
})
