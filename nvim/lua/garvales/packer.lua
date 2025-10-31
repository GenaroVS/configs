-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- fuzzy finder
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }

  }

  use({'navarasu/onedark.nvim',
  	as = 'onedark',
  	config = function()
		vim.cmd('colorscheme onedark')
	end
  })

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  use('mbbill/undotree') -- undo history

  use('tpope/vim-fugitive') -- git in nvim

  use('mason-org/mason.nvim') -- lsp installations 

  use { -- file tabs
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      requires = { {"nvim-lua/plenary.nvim"} }
  }

  use('vim-airline/vim-airline') -- status bar
  use('vim-airline/vim-airline-themes')
end)
