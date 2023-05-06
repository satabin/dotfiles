--require 'nvim-treesitter.install'.compilers = { 'clang' }
require 'nvim-treesitter.configs'.setup {
  ensure_installed = { 'scala', 'json', 'yaml', 'html', 'nix', 'java', 'lua', 'ocaml', 'haskell', 'rust', 'latex' },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true
  }
}
