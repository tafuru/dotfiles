return {
  { 'neovim/nvim-lspconfig', config = function()
      local lspconfig = require('lspconfig')
      -- basic on_attach and capabilities could be expanded later
      local on_attach = function() end
      local servers = { 'pyright', 'tsserver', 'gopls' }
      for _, srv in ipairs(servers) do
        pcall(lspconfig[srv].setup, { on_attach = on_attach })
      end
    end
  },
  { 'williamboman/mason.nvim', config = function()
      require('mason').setup()
    end
  },
  { 'williamboman/mason-lspconfig.nvim', config = function()
      require('mason-lspconfig').setup()
    end
  },
}
