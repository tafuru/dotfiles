return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function(_, opts)
    require('nvim-treesitter').setup(opts or {
      ensure_installed = { 'lua', 'python', 'javascript', 'go' },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
