return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ensure_installed = {
          "pint",
          "php-cs-fixer",
          "phpstan",
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "clojure_lsp", "ts_ls", "tailwindcss", "lua_ls", "intelephense" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    -- dependencies = {
    -- 	"hrsh7th/nvim-cmp",
    -- },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local function ts_organize_imports()
        local params = {
          command = "_typescript.organizeImports",
          arguments = { vim.api.nvim_buf_get_name(0) },
          title = "",
        }
        vim.lsp.buf.execute_command(params)
      end

      local no_virtual_text_diagnostics = function(err, result, ctx, config)
        local merged_config = vim.tbl_deep_extend("force", config or {}, { virtual_text = false })
        vim.lsp.handlers["textDocument/publishDiagnostics"](err, result, ctx, merged_config)
      end

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        handlers = {
          ["textDocument/publishDiagnostics"] = no_virtual_text_diagnostics,
        },
        on_attach = function(_, bufnr)
          pcall(vim.api.nvim_create_user_command,
            "TsserverOrganizeImports",
            ts_organize_imports,
            { desc = "Organize Imports" }
          )
          vim.keymap.set("n", "<leader>fi", ts_organize_imports, { buffer = bufnr })
        end,
      })

      vim.lsp.config("clojure_lsp", {
        capabilities = capabilities,
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>fr", "<cmd>lua vim.lsp.buf.format()<CR>", { noremap = true, buffer = bufnr })
        end,
      })

      vim.lsp.config("tailwindcss", {
        capabilities = capabilities,
      })

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })
      vim.lsp.config("fennel_ls", {
        capabilities = capabilities,
      })
      vim.lsp.config("terraformls", {
        capabilities = capabilities,
      })
      vim.lsp.config("intelephense", {
        capabilities = capabilities,
      })
      -- lspconfig.phpactor.setup({
      --   capabilities = capabilities,
      --   init_options = {
      --     ["language_server_phpstan.enabled"] = false,
      --     ["language_server_psalm.enabled"] = false,
      --   },
      --   handlers = {
      --     ["textDocument/publishDiagnostics"] = function() end,
      --   },
      --   on_attach = function(client, bufnr)
      --     vim.api.nvim_create_autocmd("FileType", {
      --       pattern = "php",
      --       callback = function()
      --         vim.opt_local.iskeyword:append("$")
      --       end,
      --     })
      --   end,
      --   settings = {
      --     phpactor = {
      --       diagnostics = {
      --         missing_return_type = false,
      --         docblock_missing_return_type = false,
      --         docblock_missing_param = false
      --       }
      --     }
      --   }
      -- })
      vim.lsp.config("dockerls", { capabilities = capabilities })
      vim.lsp.config("docker_compose_language_service", { capabilities = capabilities })

      vim.lsp.enable({
        "ts_ls",
        "clojure_lsp",
        "tailwindcss",
        "lua_ls",
        "fennel_ls",
        "terraformls",
        "intelephense",
        "dockerls",
        "docker_compose_language_service",
      })

      vim.api.nvim_create_autocmd({ "BufWritePre" }, {
        pattern = { "*.tf", "*.tfvars" },
        callback = function()
          vim.lsp.buf.format()
        end,
      })
      vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "<leader>cs", vim.lsp.buf.signature_help, {})
      vim.keymap.set("n", "<leader>cl", function() vim.diagnostic.open_float({ scope = "line" }) end, {})
      vim.keymap.set("n", "<leader>cb", function() vim.diagnostic.open_float({ scope = "buffer" }) end, {})
      vim.keymap.set('n', '<leader>cgn', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<leader>cgp', vim.diagnostic.goto_prev)

      --map("n", "<leader>ca", ":Lspsaga code_action<CR>", options)
      --map("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", options)
      --map("n", "<leader>cl", ":Lspsaga show_line_diagnostics<CR>", options)
      --map("n", "<leader>cb", ":Lspsaga show_buf_diagnostics<CR>", options)
      --map("n", "<leader>cr", ":Lspsaga rename<CR>", options)
      --map("n", "<leader>cs", ":Lspsaga signature_help<CR>", options)
      --map("n", "<leader>cp", ":Lspsaga peek_definition<CR>", options)

      -- requires plenary (which is required by telescope)
      local Float = require("plenary.window.float")

      vim.cmd([[
    augroup LspPhpactor
      autocmd!
      autocmd Filetype php command! -nargs=0 LspPhpactorReindex lua vim.lsp.buf_notify(0, "phpactor/indexer/reindex",{})
      autocmd Filetype php command! -nargs=0 LspPhpactorConfig lua LspPhpactorDumpConfig()
      autocmd Filetype php command! -nargs=0 LspPhpactorStatus lua LspPhpactorStatus()
      autocmd Filetype php command! -nargs=0 LspPhpactorBlackfireStart lua LspPhpactorBlackfireStart()
      autocmd Filetype php command! -nargs=0 LspPhpactorBlackfireFinish lua LspPhpactorBlackfireFinish()
    augroup END
]])

      local function showWindow(title, syntax, contents)
        local out = {}
        for match in string.gmatch(contents, "[^\n]+") do
          table.insert(out, match)
        end

        local float = Float.percentage_range_window(0.6, 0.4, { winblend = 0 }, {
          title = title,
          topleft = "┌",
          topright = "┐",
          top = "─",
          left = "│",
          right = "│",
          botleft = "└",
          botright = "┘",
          bot = "─",
        })

        vim.api.nvim_buf_set_option(float.bufnr, "filetype", syntax)
        vim.api.nvim_buf_set_lines(float.bufnr, 0, -1, false, out)
      end

      function LspPhpactorDumpConfig()
        local results, _ = vim.lsp.buf_request_sync(0, "phpactor/debug/config", { ["return"] = true })
        for _, res in pairs(results or {}) do
          pcall(showWindow, "Phpactor LSP Configuration", "json", res["result"])
        end
      end

      function LspPhpactorStatus()
        local results, _ = vim.lsp.buf_request_sync(0, "phpactor/status", { ["return"] = true })
        for _, res in pairs(results or {}) do
          pcall(showWindow, "Phpactor Status", "markdown", res["result"])
        end
      end

      function LspPhpactorBlackfireStart()
        local _, _ = vim.lsp.buf_request_sync(0, "blackfire/start", {})
      end

      function LspPhpactorBlackfireFinish()
        local _, _ = vim.lsp.buf_request_sync(0, "blackfire/finish", {})
      end
    end,
  },
}
