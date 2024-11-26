return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { 
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp" 
        },
        config = function()
            local lspconfig = require("lspconfig")
            local cmp_nvim_lsp = require("cmp_nvim_lsp")

            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

            local on_attach = function(client, bufnr)
                local function map(keys, func, desc)
                    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'LSP: ' .. desc })
                end
                map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
                map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
                map('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
                map('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
                map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
                map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
            end

            local servers = {
                pyright = {},
                ts_ls = {},
                eslint = {},
                html = {},
                cssls = {},
                lua_ls = {},
                clangd = {},
                rust_analyzer = {},
            }

            require('mason-lspconfig').setup({
                ensure_installed = vim.tbl_keys(servers),
            })

            for server_name, config in pairs(servers) do
                config.on_attach = on_attach
                config.capabilities = capabilities

                lspconfig[server_name].setup(config)
            end

            vim.diagnostic.config({
                virtual_text = true,
            })
        end,
    },
}

