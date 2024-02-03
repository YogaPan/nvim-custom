local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- 
-- lspconfig.pyright.setup { blabla}
lspconfig.volar.setup({
  { 'vue', 'typescript', 'javascript' },
  init_options = {

    typescript = {
      -- tsdk = '/path/to/.npm/lib/node_modules/typescript/lib'
      tsdk = '/Users/raven.pan/ghq/gitlab.com/Frontier.cool/Frontier/Platform/PlatformFrontend/node_modules/.pnpm/typescript@5.0.4/node_modules/typescript/lib'
      -- Alternative location if installed as root:
      -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
    }
  },
})
