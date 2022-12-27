local actions = require("diffview.actions")

require("diffview").setup({
  keymaps = {
    disable_defaults = false, -- Disable the default keymaps
    view = {
      -- The `view` bindings are active in the diff buffers, only when the current
      -- tabpage is a Diffview.
      ["gE"] = actions.prev_conflict, -- In the merge_tool: jump to the previous conflict
      ["ge"] = actions.next_conflict, -- In the merge_tool: jump to the next conflict
      ["nn"] = actions.focus_entry,
    },
  },
})
