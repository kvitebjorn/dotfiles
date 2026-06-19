return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "enter", -- Uses Enter to confirm completions

      -- Cycle forward through completions with Tab
      ["<Tab>"] = { "select_next", "fallback" },

      -- Cycle backward through completions with Shift+Tab
      ["<S-Tab>"] = { "select_prev", "fallback" },
    },
  },
}
