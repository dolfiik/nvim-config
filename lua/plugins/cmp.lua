return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      build = (function()
        if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
          return
        end
        return "make install_jsregexp"
      end)(),
    },
    "saadparwaiz1/cmp_luasnip",
    
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      
      mapping = cmp.mapping.preset.insert({
        -- Navigate completion menu
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        
        -- Scroll docs
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        
        -- Confirm completion
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        
        -- Trigger completion
        ["<C-Space>"] = cmp.mapping.complete(),
        
        -- Snippet navigation
        ["<C-l>"] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { "i", "s" }),
      }),
      
      -- Completion sources
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer" },
      },
    })
  end,
}
