return {
  "folke/which-key.nvim",
  config = function()
    local ok, wk = pcall(require, "which-key")
    if not ok then
      return
    end
    wk.setup({})
    wk.register({
      s = { name = "Search" },
      g = { name = "Git/LSP" },
      q = { name = "Quit/Diag" },
    }, { prefix = "<leader>" })
  end,
}
