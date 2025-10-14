return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = "single",
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        -- Automatically install these language servers
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ts_ls",
          "html",
          "cssls",
          "clangd",
          "rust_analyzer",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- LSP capabilities for completion
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

      -- Keymaps when LSP attaches to buffer
      local on_attach = function(client, bufnr)
        -- Disable semantic tokens (colors from LSP)
        client.server_capabilities.semanticTokensProvider = nil
        
        local function map(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = "LSP: " .. desc })
        end

        -- Essential LSP keymaps
        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("gr", vim.lsp.buf.references, "Go to references")
        map("gI", vim.lsp.buf.implementation, "Go to implementation")
        map("K", vim.lsp.buf.hover, "Hover documentation")
        map("<leader>rn", vim.lsp.buf.rename, "Rename")
        map("<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("<leader>D", vim.lsp.buf.type_definition, "Type definition")
      end

      -- Language server configurations
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
        pyright = {},
        ts_ls = {},
        html = {},
        cssls = {},
        clangd = {},
        rust_analyzer = {},
      }

      -- Setup each server
      for server_name, config in pairs(servers) do
        config.on_attach = on_attach
        config.capabilities = capabilities
        lspconfig[server_name].setup(config)
      end

      -- Minimal diagnostic display
      vim.diagnostic.config({
        virtual_text = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "E",
            [vim.diagnostic.severity.WARN] = "W",
            [vim.diagnostic.severity.HINT] = "H",
            [vim.diagnostic.severity.INFO] = "I",
          },
        },
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          border = "single",
          source = "always",
        },
      })
    end,
  },
}
