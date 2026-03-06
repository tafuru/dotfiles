local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.expandtab = true   -- tabs → spaces
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true   -- case-sensitive when query contains uppercase
opt.hlsearch = false
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes" -- always show, prevents layout shifts
opt.wrap = false
opt.scrolloff = 8      -- keep 8 lines above/below cursor

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Files
opt.undofile = true    -- persistent undo
opt.swapfile = false
opt.backup = false
opt.updatetime = 250

-- Yank highlight
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
  end,
})

-- Clipboard (set after startup for performance)
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end) -- sync with system clipboard
