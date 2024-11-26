local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

	require("plugins.colorscheme"),
  require("plugins.treesitter"),
  require("plugins.telescope"),
  require("plugins.comments"),
  require("plugins.mini"),
  require("plugins.gitsigns"),
  require("plugins.cmp"),
  require("plugins.lsp"),
  require("plugins.whichkey"),
})
