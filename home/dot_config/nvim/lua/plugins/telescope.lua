return {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} },
  config = function()
    local telescope = require('telescope.builtin')
    -- register keymaps in keymaps.lua instead of here for clarity
  end,
}
