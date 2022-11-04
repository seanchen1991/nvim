--[[ init.lua ]]

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.g.mapleader = " "
vim.g.localleader = ","

-- IMPORTS
require('vars')    -- Variables
require('opts')    -- Options
require('keys')    -- Keymaps
require('plug')    -- Plugins

-- PLUGINS

-- Enable oh-lucy colorscheme
vim.g.oh_lucy_italic_comments = true
vim.g.oh_lucy_italic_functions = true
vim.g.oh_lucy_transparent_background = true

vim.cmd[[colorscheme oh-lucy]]

-- Enable Impatient plugin for faster startup
require('impatient')

-- Enable Telescope
require('telescope').load_extension('projects')

-- Enable icons
require('nvim-web-devicons').setup {
    default = true
}

-- Enable nvim-tree and configure it to work with project.nvim
require('nvim-tree').setup {
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = true
    },
}

-- Set Lualine theme to its default
require('lualine').setup {}

-- Enable Hop for faster navigation
require('hop').setup {}

-- Enable autopairs
require('nvim-autopairs').setup {}

-- Enable highlighting of argument definitions
-- require('hlargs').setup {}

-- Enable mason for installing and managing LSP servers
require('mason').setup {}

-- Enable project support
require('project_nvim').setup {}

-- Enable trouble plugin to get a dedicated pane for errors and warnings
require('trouble').setup {
    auto_open = true,
    auto_close = true,
    position = 'right',
}

-- Enable easier commenting
require('nvim_comment').setup {
    comment_empty = false,
    comment_empty_trim_whitespace = false,
}

-- Setup Neovim so that it can interact with rust-analyzer
local rt = {
    server = {
        settings = {
            on_attach = function(_, bufnr)
                -- Hover actions
                vim.keymap.set('n', '<C-space>', rt.hover_actions.hover_actions, { buffer = bufnr })
                -- Code action groups
                vim.keymap.set('n', '<Leader>a', rt.code_action_group.code_action.group, { buffer = bufnr })
                require 'illuminate'.on_attach(client)
            end,
            [ 'rust-analyzer' ] = {
                checkOnSave = {
                    command = 'clippy'
                }
            }
        }
    }
}
require('rust-tools').setup(rt)

-- Auto-format on save
vim.cmd([[
autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
]])

-- LSP diagnostics setup
local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

sign({ name = 'DiagnosticsSignError', text = '[]' })
sign({ name = 'DiagnosticsSignWarn', text = '[]' })
sign({ name = 'DiagnosticsSignHint', text = '[]' })
sign({ name = 'DiagnosticsSignInfo', text = '[]' })

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- Completion plugin setup
local cmp = require('cmp')
cmp.setup({
    -- Enable LSP snippets
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Add tab support
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        })
    },
    -- Installed sources:
    sources = {
        { name = 'path' },                              -- file paths
        { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
        { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
        { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
        { name = 'buffer', keyword_length = 2 },        -- source current buffer
        { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
        { name = 'calc'},                               -- source for math calculation
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
            local menu_icon ={
                nvim_lsp = 'λ',
                vsnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
            }
            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
})

-- Treesitter plugin setup
require('nvim-treesitter.configs').setup {
    ensure_installed = { 'lua', 'rust', 'toml' },
    auto_install = true,
    highlight = {
        enable = false,
        additional_vim_regex_highlighting = false,
    },
    ident = { enable = true },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
}

