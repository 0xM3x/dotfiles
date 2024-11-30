require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "clangd", "tailwindcss", "html", "eslint", "pyright"}
})

local on_attach = function(_, _)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
require("lspconfig").clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
require("lspconfig").tailwindcss.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
require("lspconfig").html.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
require("lspconfig").eslint.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
require("lspconfig").pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

