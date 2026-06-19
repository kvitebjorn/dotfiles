return {
  -- 1. Install Zenbones and its dependencies
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optional: Add specific zenbones configuration here
      -- vim.g.zenbones_darken_comments = 45
    end,
  },

  -- 2. Set Zenbones as the default colorscheme for LazyVim
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "zenbones",
    },
  },
}

