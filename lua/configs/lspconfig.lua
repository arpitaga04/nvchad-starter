-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  -- lua
  "lua_ls",
  -- html / css
  -- "html-lsp",
  -- "css-lsp",
  -- golang
  "gopls",
  -- python
  "pyright",
  "ruff",
  -- bash
  "bashls",
  -- ansible
  "ansiblels",
  -- dockerfile
  "docker_compose_language_service",
  "dockerls",

  -- cmake
  "cmake",
  "yamlls",

  "helm_ls",
  "jsonls",
  -- terraform
  "terraformls",
  "terraform_lsp",
}

local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end


lspconfig.yamlls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    yaml = {
      schemaStore = {
        -- You must disable built-in schemaStore support if you want to use
        -- this plugin and its advanced options like `ignore`.
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = "",
      },
      schemas = require('schemastore').yaml.schemas(),
      -- schemas = {
      --   ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      --   ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.18.0-standalone-strict/all.json"] = "/*.k8s.yaml",
      --   ["https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/prometheus.json"] = "prometheus.yaml",
      --   ["https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/prometheus.rules.json"] = "*rules.yaml",
      --   ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose.yaml",
      -- },
    },
  }
}
lspconfig.jsonls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}
-- lspconfig.ansiblels.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
--   filetypes = {""}
-- }

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
