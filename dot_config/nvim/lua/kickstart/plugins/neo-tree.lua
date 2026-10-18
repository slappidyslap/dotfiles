vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

local keymap = '<leader>e'
vim.keymap.set('n', keymap, '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })


require('neo-tree').setup {
  filesystem = {
    window = {
      mappings = {
        [keymap] = 'close_window',
        ["l"] = "open",
        ["h"] = "close_node",

        ["<space>"] = "select",
        ["<tab>"] = "none",

        ["d"] = "trash",
        ["D"] = "delete",
        ["T"] = "none",

        ["s"] = "open_split",
        ["v"] = "open_vsplit",
        ["S"] = "none",

        ["P"] = { "toggle_preview", config = { use_float = false } },

        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
            vim.notify("Full path of file copied")
          end,
          desc = "Copy Path to Clipboard",
        },
      },
    },
  },
  source_selector = {
    statusline = true,
  },
}
