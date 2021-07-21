require'nvim-treesitter.configs'.setup {
  ensure_installed = { "typescript", "tsx", "css", "haskell", "elm" },
  highlight = {
    enable = true,
    disable = { "typescript", "tsx" }
  },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr"
      }
    }
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm"
    }
  },

  navigation = {
    enable = true,
    keymaps = {
      goto_definition = "gnd",
      list_definitions = "gnD",
      goto_next_usage = "<a-*>",
      goto_previous_usage = "<a-#>"
    }
  },

  -- textobjects = {
  --   select = {
  --     enable = true,
  --     keymaps = {
  --       ["af"] = "@function.outer",
  --       ["if"] = "@function.inner",
  --       ["iF"] =  {
  --         typescript = "(function_definition) @function"
  --       }
  --     }
  --   },
  --   move = {
  --     enable = true,
  --     goto_next_start = {
  --       ["]m"] = "@function.outer",
  --       -- ["]]"] = "@class.outer",
  --     },
  --     goto_next_end = {
  --       ["]M"] = "@function.outer",
  --       -- ["]["] = "@class.outer",
  --     },
  --     goto_previous_start = {
  --       ["[m"] = "@function.outer",
  --       -- ["[["] = "@class.outer",
  --     },
  --     goto_previous_end = {
  --       ["[M"] = "@function.outer",
  --       -- ["[]"] = "@class.outer",
  --     },
  --   }
  -- }

  playground = {
    enable = true,
    disable = {},
    updatetiime = 25,
    persist_queries = false
  }
}
