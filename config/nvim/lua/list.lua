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

local plugins = {
  -- ui
  { "catppuccin/nvim", name = "catppuccin" },
  { "NTBBloodbath/sweetie.nvim" },
  { "karb94/neoscroll.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "nanozuki/tabby.nvim" },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
  },
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  { "nvim-tree/nvim-web-devicons" },
  { "folke/which-key.nvim" },
  { "folke/trouble.nvim" },
  { "nvim-tree/nvim-tree.lua" },
  { "freddiehaddad/feline.nvim" },
  {
    "gelguy/wilder.nvim",
    build = ":UpdateRemotePlugins",
    dependencies = {
      {
        "romgrk/fzy-lua-native",
        build = "make",
      },
    },
  },

  -- git
  { "APZelos/blamer.nvim" },
  { "lewis6991/gitsigns.nvim" },
  { "TimUntersberger/neogit" },
  { "sindrets/diffview.nvim" },

  -- editor
  { "nvim-treesitter/nvim-treesitter" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "rafamadriz/friendly-snippets" },
  { "numToStr/Comment.nvim" },
  { "gpanders/editorconfig.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },
  { "windwp/nvim-autopairs" },
  { "windwp/nvim-ts-autotag" },
  { "NvChad/nvim-colorizer.lua" },
  { "otavioschwanck/cool-substitute.nvim" },
  { "woosaaahh/sj.nvim" },
  { "yamatsum/nvim-cursorline" },
  { "m4xshen/autoclose.nvim" },

  -- lsp
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "jayp0521/mason-null-ls.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "onsails/lspkind.nvim" },
  { "jose-elias-alvarez/null-ls.nvim" },
  { "jose-elias-alvarez/typescript.nvim" },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
  },
}

require("lazy").setup(plugins)
