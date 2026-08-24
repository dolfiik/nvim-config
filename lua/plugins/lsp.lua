return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = "single",
        },
      })
    end,
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

      local on_attach = function(client, bufnr)
        client.server_capabilities.semanticTokensProvider = nil

        local function map(keys, func, desc)
          vim.keymap.set("n", keys, func, {
            buffer = bufnr,
            desc = "LSP: " .. desc,
          })
        end

        map("gd", vim.lsp.buf.definition, "Go to definition")
        map("gr", vim.lsp.buf.references, "Go to references")
        map("gI", vim.lsp.buf.implementation, "Go to implementation")
        map("K", vim.lsp.buf.hover, "Hover documentation")
        map("<leader>rn", vim.lsp.buf.rename, "Rename")
        map("<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("<leader>D", vim.lsp.buf.type_definition, "Type definition")
      end

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

      for server_name, server_config in pairs(servers) do
        server_config.capabilities = vim.tbl_deep_extend(
          "force",
          {},
          capabilities,
          server_config.capabilities or {}
        )

        server_config.on_attach = on_attach

        vim.lsp.config(server_name, server_config)
      end

      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers),
        automatic_enable = true,
      })

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
