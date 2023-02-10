local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

-- add list of plugins to install
require("lazy").setup({

  "nvim-lua/plenary.nvim", -- lua functions that many plugins use

  -- colorschemes
  "folke/tokyonight.nvim",
  "EdenEast/nightfox.nvim",

  -- essential plugins
  "tpope/vim-surround", -- add, delete, change surroundings (it's awesome)

  -- commenting with gc
  "numToStr/Comment.nvim",

  -- file explorer
  "nvim-tree/nvim-tree.lua",

  -- vs-code like icons
  "nvim-tree/nvim-web-devicons",

  -- statusline
  "nvim-lualine/lualine.nvim",

  -- fuzzy finding w/ telescope
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
  { "nvim-telescope/telescope.nvim", branch = "0.1.x" }, -- fuzzy finder

  -- autocompletion
  "hrsh7th/nvim-cmp", -- completion plugin
  "hrsh7th/cmp-buffer", -- source for text in buffer
  "hrsh7th/cmp-path", -- source for file system paths
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",

  -- snippets
  "L3MON4D3/LuaSnip", -- snippet engine
  "saadparwaiz1/cmp_luasnip", -- for autocompletion
  "rafamadriz/friendly-snippets", -- useful snippets

  -- managing & installing lsp servers, linters & formatters
  "williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
  "williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig

  -- configuring lsp servers
  "neovim/nvim-lspconfig", -- easily configure language servers
  { "glepnir/lspsaga.nvim", branch = "main" }, -- enhanced lsp uis
  "jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
  "onsails/lspkind.nvim", -- vs-code like icons for autocompletion

  -- useful status updates for lsp
  "j-hui/fidget.nvim",

  -- formatting & linting
  "jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
  "jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

  -- treesitter configuration
  {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
      ts_update()
    end,
  },

  { -- additional text objects via treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
  },

  -- auto closing
  "windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
  { "windwp/nvim-ts-autotag" }, -- autoclose tags

  -- heuristically set buffer options
  "tpope/vim-sleuth",

  -- git integration
  "lewis6991/gitsigns.nvim", -- show line modifications on left hand side
  "kdheepak/lazygit.nvim",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua api.
  "folke/neodev.nvim",

  -- whichkey is a lua plugin for neovim that displays a popup with possible key bindings of the command you started typing.
  "folke/which-key.nvim",

  -- alpha is a fast and fully programmable greeter for neovim.
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- debugging
  "mfussenegger/nvim-dap",
  { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },

  -- terminal integration
  {
    "akinsho/toggleterm.nvim",
    tag = "*",
  },

  { "akinsho/bufferline.nvim", tag = "v3.*", dependencies = "nvim-tree/nvim-web-devicons" },

  -- PHP completion, refactoring, introspection tool and language server.
  {
    "phpactor/phpactor",
    branch = "master",
    ft = "php",
    build = "composer install --no-dev -o",
  },
  -- Seamless navigation between tmux panes and vim splits
  "christoomey/vim-tmux-navigator",

  -- A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },

  -- Codeium
  -- use("Exafunction/codeium.vim")

  -- Indent guides for Neovim
  "lukas-reineke/indent-blankline.nvim",

  -- vim notify
  "rcarriga/nvim-notify",

  -- ui niceness
  "stevearc/dressing.nvim",

  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        -- add any options here
      })
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
})
