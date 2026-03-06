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
      -- vim.lsp.enable is available from nvim 0.11+
      if vim.fn.has('nvim-0.11') == 1 then
        vim.lsp.enable({ 'pyright', 'ts_ls', 'gopls' })
      end
    end,
  },
}
