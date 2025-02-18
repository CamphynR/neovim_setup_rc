require('options') -- Options
require('keymaps') -- Key bindings
require('config.lazy') -- lazy nvim package manager
require('colorscheme') -- Color scheme
require('nerdicons').setup({}) -- Font
require('vim-slime')

-- lsp config 
require('mason').setup() -- mason for lsp management
require('mason-lspconfig').setup({
    ensure_installed = { 'pylsp', 'lua_ls', 'clangd'}
})

-- folder structure
require('nvim-tree').setup({
        view = {
            width = 30,
            side = 'left'
        },
        update_focused_file = {
            enable = true
        },
        filters = {
            dotfiles = false
        },
        git = {
            enable = true,
            ignore = false
            },
        filesystem_watchers = {
            enable = true
            }
})

-- use mason-lspconfig to manage lsp servers setup
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("mason-lspconfig").setup_handlers {
        function (server_name)
            lspconfig[server_name].setup {
            capabilities = capabilities
            }
        end,

        ["pylsp"] = function ()
            lspconfig.pylsp.setup {
                capabilities = capabilities,
                settings = {
                        pylsp = {
                            plugins = {
                                pycodestyle = {
                                    ignore = { "E501", "E302", "E303", "E122", "E203", "E226", "E251", "W291", "W293"},
                                    maxLineLength = 100
                                }
                            }
                        }
                    }
                }		
        end

}

