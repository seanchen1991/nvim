-- [[ plug.lua ]]

return require('packer').startup(function(use)
    -- [[ Plugins Go Here ]]

    -- Have Packer manage itself
    use 'wbthomason/packer.nvim'    

    -- File browser
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    
    -- Start screen for Neovim
    use 'mhinz/vim-startify'

    -- Helps you see your cursor better
    use 'DanilaMihailov/beacon.nvim'

    -- A status line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Theme
    -- use 'tanvirtin/monokai.nvim'
    -- use 'Mofiqul/dracula.nvim'
    use 'navarasu/onedark.nvim'
    
    -- To quickly find files
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- To more clearly show indent lines
    use 'Yggdroot/indentLine'

    -- To integrate with git repositories
    use 'tpope/vim-fugitive'
    
    -- To easily browse commit history
    use 'junegunn/gv.vim'
    
    -- To automatically close brackets, parens, braces, etc.
    use 'windwp/nvim-autopairs'

    -- Manage LSP servers, debuggers, and linters
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    -- LSP config plugins
    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'

    -- Completion framework
    use 'hrsh7th/nvim-cmp'

    -- LSP completion source
    use 'hrsh7th/cmp-nvim-lsp'

    -- Useful completion sources
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'                             
    use 'hrsh7th/cmp-path'                              
    use 'hrsh7th/cmp-buffer'                            
    use 'hrsh7th/vim-vsnip'

    -- Treesitter
    use 'nvim-treesitter/nvim-treesitter'

    -- Bring up a separate terminal with a keystroke
    use 'voldikss/vim-floaterm'

    -- Dedicated pane for errors and warnings
    use 'folke/trouble.nvim'

    -- Leverage Treesitter to highlight argument definitions
    use 'm-demare/hlargs.nvim'

    -- Highlight other uses of the word under the cursor
    use 'RRethy/vim-illuminate'

    -- Easier commenting
    use 'terrortylor/nvim-comment'
    
    -- Markdown preview 
    use 'ellisonleao/glow.nvim'

    -- Project support
    use { 
        'ahmedkhalf/project.nvim', 
        requires = { "neovim/nvim-lspconfig" },
        config = "require'project-config'"
    }

    -- Hop for faster navigation
    use { 'phaazon/hop.nvim', branch = 'v2' }

    -- Plugin to improve NeoVim startup time
    use 'lewis6991/impatient.nvim'

    config = {
        packet_root = vim.fn.stdpath('config') .. '/site/pack'
    }
end)
