local coqtailhighlights_group = vim.api.nvim_create_augroup("CoqtailHighlights", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme",  {
  pattern = "nord",
  callback = function()
    vim.api.nvim_set_hl(0, 'CoqtailSent', { bg = '#b48ead' })
    vim.api.nvim_set_hl(0, 'CoqtailChecked', { bg = '#3a5557' })
    vim.api.nvim_set_hl(0, 'CoqtailError', { bg = '#bf616a' })
  end,
  group = coqtailhighlights_group
})
