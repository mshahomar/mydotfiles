return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ruff_lsp = {
        settings = {
          ruff = {
            lineLength = 88,
            extendSelect = true,
            select = { "E501", "E203", "E231", "E241", "E242" },
          },
        },
      },
    },
  },
}
