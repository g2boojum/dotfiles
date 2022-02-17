local opt = vim.opt

opt.updatetime = 250 --Decrease update time
opt.signcolumn = "yes" -- Always show sign column
opt.timeoutlen = 300 -- for WhichKey

require("github-theme").setup( {
  theme_style = "light",
})

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]
