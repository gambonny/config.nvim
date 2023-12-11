local diagnostic_opts = {
  severity = vim.diagnostic.severity.ERROR,
}

local function next_error()
  vim.diagnostic.goto_next(diagnostic_opts)
end

local function prev_error()
  vim.diagnostic.goto_prev(diagnostic_opts)
end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "nvim-lua/plenary.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require("lspconfig")

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local opts = require("utils").opts
    local on_attach = function(_, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "<leader>gr", "<cmd>TroubleToggle lsp_references<CR>", opts)

      opts.desc = "See available code actions"
      keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

      opts.desc = "Show LSP implementations"
      keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations theme=dropdown<CR>", opts)

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "<leader>gt", "<cmd>TroubleToggle lsp_type_definitions<CR>", opts)

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>gD", "<cmd>TroubleToggle document_diagnostics<CR>", opts)

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d/", vim.diagnostic.open_float, opts)

      opts.desc = "Show LSP definitions"
      keymap.set("n", "<leader>gd", "<cmd>TroubleToggle lsp_definitions<CR>", opts)

      opts.desc = "Go to previous error"
      keymap.set("n", "[d", prev_error, opts)

      opts.desc = "Go to next error"
      keymap.set("n", "]d", next_error, opts)

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[D", vim.diagnostic.goto_prev, opts)

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]D", vim.diagnostic.goto_next, opts)

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts)

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["tsserver"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["biome"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["graphql"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })

    lspconfig["emmet_ls"].setup({
      capabilities = vim.tbl_deep_extend("keep", capabilities, {
        textDocument = {
          completion = {
            completionItem = {
              snippetSupport = true,
            },
          },
        },
      }),
      on_attach = on_attach,
    })

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })
  end,
}
