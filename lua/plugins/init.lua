return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "stevearc/dressing.nvim",
    -- event = "VeryLazy",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "bash",
        "awk",
        "c",
        "cmake",
        "comment",
        "cpp",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "go",
        "hcl",
        "helm",
        "jq",
        "json",
        "make",
        "markdown",
        "nginx",
        "python",
        "ssh_config",
        "terraform",
        "yaml",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    },
  },
  {
    "gbprod/substitute.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local substitute = require "substitute"

      substitute.setup()
      -- set keymaps
      local keymap = vim.keymap -- for conciseness
      keymap.set("n", "s", substitute.operator, { desc = "Substitute with motion" })
      keymap.set("n", "ss", substitute.line, { desc = "Substitute line" })
      keymap.set("n", "S", substitute.eol, { desc = "Substitute to end of line" })
      keymap.set("x", "s", substitute.visual, { desc = "Substitute in visual mode" })
    end,
  },
  {
    "kylechui/nvim-surround",
    event = { "BufReadPre", "BufNewFile" },
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
  },
}
