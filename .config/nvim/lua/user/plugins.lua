-- Bootstrap script {{{

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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- }}}

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(
  function (use)
    -- Commons --
    use "wbthomason/packer.nvim"
    use "nvim-lua/plenary.nvim"
    use "moll/vim-bbye"
    use "ahmedkhalf/project.nvim"
    use "antoinemadec/FixCursorHold.nvim"

    -- Zen mode --
    use {
      "Pocco81/TrueZen.nvim",
      config = function ()
        require "true-zen".setup {
          integrations = {
            gitsigns = true,
            lualine = true
          }
        }
      end
    }

    -- Lualine --
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Color schemes --
    use "lunarvim/darkplus.nvim"
    use "tanvirtin/monokai.nvim"

    -- Easymotion --
    use {
      "phaazon/hop.nvim",
      branch = "v2",
      config = function ()
        require "hop".setup {
          keys = 'etovxqpdygfblzhckisuran', term_seq_bias = 0.5
        }
      end
    }

    -- cmp plugins --
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"

    -- Snippets --
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- LSP support --
    use "williamboman/nvim-lsp-installer"
    use "neovim/nvim-lspconfig"
    use "arkav/lualine-lsp-progress"

    -- Telescope --
    use "nvim-telescope/telescope.nvim"
    use 'nvim-telescope/telescope-media-files.nvim'
    use "nvim-telescope/telescope-ui-select.nvim"

    -- Trouble --
    use {
      "folke/trouble.nvim",
      config = function ()
        require "trouble".setup {}
      end,
    }

    -- Git signs --
    use "lewis6991/gitsigns.nvim"

    -- nvim-tree --
    use 'kyazdani42/nvim-tree.lua'

    -- Text manipulation --
    use {
      "terrortylor/nvim-comment",
      config = function ()
        require("nvim_comment").setup {}
      end
    }
    use {
      "cappyzawa/trim.nvim",
      config = function ()
        require("trim").setup {}
      end,
    }
    use {
      "ur4ltz/surround.nvim",
      config = function ()
        require"surround".setup {mappings_style = "surround"}
      end
    }

    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end
)
