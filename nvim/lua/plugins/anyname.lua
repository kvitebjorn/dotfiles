local plugins = {

  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local dashboard = require "alpha.themes.dashboard"
      dashboard.section.header.val = require "other.dashboard-art-lain"

      dashboard.section.buttons.val = {
        dashboard.button("i", "    new file", ":ene <BAR> startinsert<CR>"),
        dashboard.button("o", "    old files", ":Telescope oldfiles<CR>"),
        dashboard.button("f", "󰥨    find file", ":Telescope file_browser<CR>"),
        dashboard.button("g", "󰱼    find text", ":Telescope live_grep_args<CR>"),
        dashboard.button("h", "    browse git", ":Flog<CR>"),
        dashboard.button("l", "󰒲    lazy", ":Lazy<CR>"),
        dashboard.button("m", "󱌣    mason", ":Mason<CR>"),
        dashboard.button("p", "󰄉    profile", ":Lazy profile<CR>"),
        dashboard.button("q", "󰭿    quit", ":qa<CR>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "Normal"
        button.opts.hl_shortcut = "Function"
      end
      dashboard.section.footer.opts.hl = "Special"
      dashboard.opts.layout = {
        dashboard.section.header,
        dashboard.section.buttons,
        dashboard.section.footer,
      }
      return dashboard
    end,
    config = function(_, dashboard)
      -- close lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end
      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "󱐋 " .. stats.count .. " plugins loaded in " .. ms .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "go", "lua", "vim" },
    },
  },

  -- If your opts uses a function call ex: require*, then make opts spec a function
  -- should return the modified default config as well
  -- here we just call the default telescope config
  -- And edit its mappinsg
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"

      conf.defaults.mappings.i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<Esc>"] = require("telescope.actions").close,
      }

      -- or
      -- table.insert(conf.defaults.mappings.i, your table)

      return conf
    end,
  },

  -- In order to modify the `lspconfig` configuration:
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {},
  },

  {
    "mfussenegger/nvim-dap",
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
  },

  {
    "olexsmir/gopher.nvim",
    ft = "go",
    -- branch = "develop", -- if you want develop branch
    -- keep in mind, it might break everything
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap", -- (optional) only if you use `gopher.dap`
    },
    -- (optional) will update plugin's deps on every update
    build = function()
      vim.cmd.GoInstallDeps()
    end,
    opts = {},
  },
}

return plugins
