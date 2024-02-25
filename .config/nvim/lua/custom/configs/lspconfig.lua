local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "clangd", "tsserver", "gopls",  "volar", "svelte", "elixirls", "tailwindcss" }

local util = require "lspconfig/util"

for _, lsp in ipairs(servers) do
  local lsp_config = {
    on_attach = on_attach,
    capabilities = capabilities,
    -- Add extra configurations here that apply to all servers
  }

  if lsp == "gopls" then
    -- Add extra configurations specific to gopls
    lsp_config.cmd = {"gopls"}
    lsp_config.filetypes = {"go", "gomod", "gowork", "gotmpl"}
    lsp_config.root_dir = util.root_pattern("go.work", "go.mod", ".git")
    lsp_config.settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true
        }
      }
    }
  end

  if lsp == "clangd" then
    lsp_config.on_attach = function(client, bufnr)
    client.server_capabilities.server_capabilities.signatureHelpProvider = false
      on_attach(client, bufnr)
    end
    lsp_config.capabilities = capabilities
  end

  if lsp == "tsserver" then
    lsp_config.filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
  end

  if lsp == "svelte" then
    lsp_config.filetypes = { "svelte" }
  end

  if lsp == "elixirls" then
    lsp_config.cmd = {"/home/mori/.local/share/nvim/mason/bin/elixir-ls"}
  end

  lspconfig[lsp].setup(lsp_config)
end
