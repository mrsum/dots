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
  use ("wbthomason/packer.nvim")
  use ("folke/tokyonight.nvim")
  use ("norcalli/nvim-colorizer.lua")
  use ("karb94/neoscroll.nvim")
  use ({
    "neoclide/coc.nvim",
    as = "coc",
    branch = "release",
  })
  use ("akinsho/toggleterm.nvim")
  use ('gelguy/wilder.nvim')

  -- lines
  use ({
    "nvim-lualine/lualine.nvim",
    requires = {"kyazdani42/nvim-web-devicons", opt = true}
  })
  use ({
    "kdheepak/tabline.nvim",
    requires = {
      { "hoob3rt/lualine.nvim", opt=true },
      { "kyazdani42/nvim-web-devicons", opt = true}
    }
  })
  use ({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use ({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
    },
  })
  use ({
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons",
    },
    tag = "nightly"
  })
  use ("lewis6991/gitsigns.nvim")
  use ("APZelos/blamer.nvim")
  use ("numToStr/Comment.nvim")
  use ("maxmellon/vim-jsx-pretty")
  use ("lukas-reineke/indent-blankline.nvim")
  use ("gpanders/editorconfig.nvim")
  use ("windwp/nvim-autopairs")
  use ("ur4ltz/surround.nvim")

   if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
