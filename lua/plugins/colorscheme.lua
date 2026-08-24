return {
  {
    "csgn/nolife.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = "dark"
      vim.cmd.colorscheme("nolife")
    end,
  },
}
