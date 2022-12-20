require('lualine').setup {
  ...,
  options = {
    icons_enabled = true,
    theme = 'nord',
  },
  tabline = {
    lualine_a = { 'buffers' },
  },
}
