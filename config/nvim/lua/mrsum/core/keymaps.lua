return {
  "folke/which-key.nvim",
  name = "_.mrsum.core.keymaps",
  config = function()
    local setup, wk = pcall(require, "which-key")
    if not setup then
      return
    end

    local normal_mode = {
      mode = { "n" },

      -- Copy all
      ["<C-c>"] = { "<cmd> %y+ <CR>", "Copy whole file" },

      -- jump mode
      ["qq"] = { "<cmd>:q!<cr>", "Exit without savings" },

      -- neotree
      ["<C-e>"] = { "<cmd>Neotree toggle<cr>", "Neotree toggle" },

      -- global keys
      ["<CR>"] = { "<cmd>noh<cr><cr>", "Clear highlights" },
      ["<C-s>"] = { "<cmd>:w<cr>", "Save file" },
      ["<C-q>"] = { "<cmd>:q!<cr>", "Quit" },
      ["<C-a>"] = { "ggVG", "Select all" },

      -- fzf
      ["<S-P>"] = { "<cmd>FzfLua files<cr>", "Pick file" },
      ["<S-F>"] = { "<cmd>FzfLua live_grep<cr>", "Grep string" },
      ["<S-O>"] = { "<cmd>Lspsaga outline<cr>", "Grep string" },

      ["<S-S>"] = { "<cmd>FzfLua git_status<cr>", "Git status" },
      ["<S-B>"] = { "<cmd>FzfLua git_branches<cr>", "Git branches" },
      ["<S-C>"] = { "<cmd>FzfLua git_commits<cr>", "Git commits" },

      ["."] = { "<cmd>Lspsaga finder<cr>", "LSP finder" },

      -- lsp
      ["<S-K>"] = { "<cmd>Lspsaga hover_doc<cr>", "LSP hover doc" },
      ["<S-L>"] = { "<cmd>FzfLua lsp_references<cr>", "LSP references" },
      ["<S-D>"] = { "<cmd>Trouble diagnostics toggle<cr>", "LSP document diagnostics" },
      ["<S-Q>"] = { "<cmd>FzfLua lsp_quickfix<cr>", "LSP quickfix" },

      -- spits
      ["<S-V>"] = { "<cmd>vs<cr>", "Vertical split" },
      ["<S-H>"] = { "<cmd>sp<cr>", "Horizontal split" },

      -- split.navigation
      ["<S-Up>"] = { "<cmd>SmartCursorMoveUp<cr>", "Go to upper split" },
      ["<S-Down>"] = { "<cmd>SmartCursorMoveDown<cr>", "Go to bottom split" },
      ["<S-Right>"] = { "<cmd>SmartCursorMoveRight<cr>", "Go to right split " },
      ["<S-Left>"] = { "<cmd>SmartCursorMoveLeft<cr>", "Go to left split" },

      -- tabs
      ["<C-t>"] = { "<cmd>$tabnew<cr>", "New tab" },
      ["<C-w>"] = { "<cmd>tabclose<cr>", "Close tab" },
      ["<Tab>"] = { "<cmd>tabn<cr>", "Next tab" },
      ["<S-Tab>"] = { "<cmd>tabp<cr>", "Prev tab" },

      -- plugins hotkeys
      ["<C-g>"] = { "<cmd>Neogit<cr>", "Open Neogit" },
      ["<C-d>"] = { "<cmd>DiffviewOpen<cr>", "Open Diffview" },
    }

    local insert_mode = {
      mode = { "i" },

      ["<C-b>"] = { "<ESC>^i", "Beginning of line" },
      ["<C-e>"] = { "<End>", "End of line" },

      --
      ["<C-s>"] = { "<esc> :w<cr>", "[S]ave file" },
    }

    local visual_mode = {
      mode = { "v" },

      --
      ["<"] = { "<gv", "Move left" },
      [">"] = { ">gv", "Move right" },
    }

    wk.setup({})

    wk.register(normal_mode)
    wk.register(insert_mode)
    wk.register(visual_mode)
  end,
}
