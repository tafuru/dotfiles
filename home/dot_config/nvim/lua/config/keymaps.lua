local map = vim.keymap.set

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Stay in indent mode when indenting in visual mode
map("v", "<", "<gv", { desc = "Indent left (keep selection)" })
map("v", ">", ">gv", { desc = "Indent right (keep selection)" })

-- Move lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Diagnostics: open quickfix with diagnostics
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

-- Terminal: <Esc><Esc> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Clear search highlight
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Telescope finders (lazy-loaded on call)
map('n', '<leader>ff', function()
  local fb = require('telescope.builtin')
  if vim.fn.executable('fd') == 1 then
    fb.find_files({ find_command = {'fd', '--type', 'f', '--hidden', '--follow', '--exclude', '.git'}, prompt_title = 'Files (incl. dotfiles, excl .git)' })
  else
    fb.find_files({ hidden = true, file_ignore_patterns = {'.git'}, prompt_title = 'Files (incl. dotfiles, excl .git)' })
  end
end, { desc = 'Telescope find files (include dotfiles, ignore .git)' })
map('n', '<leader>fg', function() require('telescope.builtin').live_grep() end, { desc = 'Telescope live grep' })

