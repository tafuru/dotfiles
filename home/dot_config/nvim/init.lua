-- Bootstrap lazy.nvim and configure Gruvbox Dark
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.o.termguicolors = true

-- Plugin specification
require("lazy").setup({
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      vim.o.background = "dark"
      require("gruvbox").setup({})
      vim.cmd("colorscheme gruvbox")
    end,
  },
})
