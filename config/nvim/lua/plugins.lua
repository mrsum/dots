local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- plugins
return packer.startup(function(use)

  -- run packer itself
  use ("wbthomason/packer.nvim")

  -- colorscheme
  use ("folke/tokyonight.nvim")

  -- colorizer
  use ("norcalli/nvim-colorizer.lua")

  -- smooth scroll
  use ("karb94/neoscroll.nvim")

  -- term
  use ("akinsho/toggleterm.nvim")

  -- coc
  use ({ "neoclide/coc.nvim", branch = "release" })

  -- lualine
  use ({
    "nvim-lualine/lualine.nvim",
    requires = {"kyazdani42/nvim-web-devicons", opt = true}
  })

  -- tabline
  use ({
    "kdheepak/tabline.nvim",
    requires = {
      { "hoob3rt/lualine.nvim", opt=true },
      { "kyazdani42/nvim-web-devicons", opt = true}
    }
  })

  -- treesitter
  use ({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })

  -- git
  use ("lewis6991/gitsigns.nvim")
  use ("APZelos/blamer.nvim")

  -- telescope
  use ({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
    },
  })

  -- nvim tree
  use ({
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
    tag = "nightly"
  })

  -- comment
  use ("numToStr/Comment.nvim")

  -- code
  use ("maxmellon/vim-jsx-pretty")
  use ("lukas-reineke/indent-blankline.nvim")
  use ("gpanders/editorconfig.nvim")
  use ("windwp/nvim-autopairs")

  -- surround
  use ("ur4ltz/surround.nvim")

   if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
