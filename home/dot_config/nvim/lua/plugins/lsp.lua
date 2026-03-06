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
      local lspconfig = require('lspconfig')
      local on_attach = function() end
      local servers = { 'pyright', 'ts_ls', 'gopls' }
      for _, srv in ipairs(servers) do
        pcall(lspconfig[srv].setup, { on_attach = on_attach })
      end
    end,
  },
}
