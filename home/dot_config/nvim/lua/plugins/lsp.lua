return {
  { 'williamboman/mason.nvim',
    config = function() require('mason').setup() end,
  },
  { 'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function() require('mason-lspconfig').setup() end,
  },
  { 'neovim/nvim-lspconfig',
    dependencies = { 'williamboman/mason-lspconfig.nvim' },
    config = function()
      vim.lsp.enable({ 'pyright', 'ts_ls', 'gopls' })
    end,
  },
}
