require('lualine').setup {
  ...,
  options = {
    icons_enabled = true,
    theme = 'nord',
  },
  tabline = {
    lualine_a = {'buffers'},
  },
  sections = {
    lualine_c = {
      ...,
      'lsp_progress'
    }
  }
}
