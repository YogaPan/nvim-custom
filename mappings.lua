---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    ["<leader>gg"] = {
      function()
        require("lazygit").lazygit()
      end,
      "lazygit",
    },

    ["<leader>a"] = {
      function()
        require("harpoon"):list():append()
      end,
    },
    ["<C-e>"] = {
      function()
        local harpoon = require "harpoon"

        -- basic telescope configuration
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
          local file_paths = {}
          for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
          end

          require("telescope.pickers")
            .new({}, {
              prompt_title = "Harpoon",
              finder = require("telescope.finders").new_table {
                results = file_paths,
              },
              previewer = conf.file_previewer {},
              sorter = conf.generic_sorter {},
            })
            :find()
        end

        toggle_telescope(harpoon:list())
      end,
      "Open harpoon window",
    },
    ["<C-h>"] = {
      function()
        require("harpoon"):list():select(1)
      end,
    },
    ["<C-t>"] = {
      function()
        require("harpoon"):list():select(2)
      end,
    },
    -- ["<C-n>"] = {
    --   function()
    --     require("harpoon"):list():select(3)
    --   end,
    -- },
    ["<C-s>"] = {
      function()
        require("harpoon"):list():select(4)
      end,
    },
    -- Toggle previous & next buffers stored within Harpoon list
    ["<C-S-P>"] = {
      function()
        require("harpoon"):list():prev()
      end,
    },
    ["<C-S-N>"] = {
      function()
        require("harpoon"):list():next()
      end,
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

return M
