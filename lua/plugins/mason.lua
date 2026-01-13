return {
  { "williamboman/mason.nvim", opts = {} },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "black",
        "isort",
        "prettier",
        "rustfmt",
        "clang-format", -- for c format     
      },
    },
  },
}
