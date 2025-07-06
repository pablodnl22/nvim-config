-- ~/.config/nvim/lua/pablodnl22/lazy.lua

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
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  { "folke/tokyonight.nvim" },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    enable=true
  },

  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  { "theprimeagen/harpoon" },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({})
    end,
  },

  { "nvim-tree/nvim-web-devicons" },

  { "mbbill/undotree" },

  { "tpope/vim-fugitive" },

  { "lewis6991/gitsigns.nvim" },

  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvimtools/none-ls-extras.nvim",
    },
    enabled = true,
  },

  {
    "stevearc/aerial.nvim",
    config = function()
      require("aerial").setup()
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("trouble").setup({})
    end,
  },

  {
    "jackMort/ChatGPT.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    config = function()
       require("pablodnl22.lsp")
     end,
    dependencies = {
      -- LSP Support
      "neovim/nvim-lspconfig",
      {
        "williamboman/mason.nvim",
        build = ":MasonUpdate"
      },
      "williamboman/mason-lspconfig.nvim",

      -- Autocompletion
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
    },
  },

})

