return {
  "phaazon/blink.vim",
  -- lightweight completion, basic setup can be extended by user
  config = function()
    -- use omnifunc fallback, enable basic mappings if needed
    vim.o.completeopt = "menuone,noselect"
  end,
}
