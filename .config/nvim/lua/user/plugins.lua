local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
  -- Packer can manage itself
  use {'wbthomason/packer.nvim'}
  
  -- colorscheme
  use { 'dracula/vim', as = 'dracula' } -- Dracula theme
  
  -- statusLine
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  
  -- Treesitter
   use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}

   -- NvimTree
   use {
    'nvim-tree/nvim-tree.lua',
    requires = {
    'nvim-tree/nvim-web-devicons',
   },

   -- LSP
   use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
   },

   -- Completion
   use {'hrsh7th/nvim-cmp'},
   use {'hrsh7th/cmp-nvim-lsp'},
   use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
   }),
   use { 'saadparwaiz1/cmp_luasnip' },
   use { "rafamadriz/friendly-snippets" },

   -- Colorizer
   use { 'norcalli/nvim-colorizer.lua' },
   
   -- Markdown Preview
   use({
      "iamcco/markdown-preview.nvim",
      run = function()
          vim.fn["mkdp#util#install"]()
          end,
    })
}


end)
