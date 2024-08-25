local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls_bash = require "null-ls"

local opts = {
  sources = {
    null_ls_bash.builtins.formatting.shfmt, -- shell script formatting
    null_ls_bash.builtins.formatting.prettier, -- markdown formatting
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format { bufnr = bufnr }
        end,
      })
    end
  end,
}
return opts
