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
      ["<S-O>"] = { "<cmd>FzfLua lsp_document_symbols<cr>", "Grep string" },

      ["<S-S>"] = { "<cmd>FzfLua git_status<cr>", "Git status" },
      ["<S-B>"] = { "<cmd>FzfLua git_branches<cr>", "Git branches" },
      ["<S-C>"] = { "<cmd>FzfLua git_commits<cr>", "Git commits" },

      -- lsp
      ["."] = { "<cmd>FzfLua lsp_finder<cr>", "LSP finder" },
      ["<S-L>"] = { "<cmd>FzfLua lsp_references<cr>", "LSP references" },
      ["<S-D>"] = { "<cmd>FzfLua lsp_document_diagnostics<cr>", "LSP document diagnostics" },
      ["<S-W>"] = { "<cmd>FzfLua lsp_workspace_diagnostics<cr>", "LSP workspace diagnostics" },
      ["<S-Q>"] = { "<cmd>FzfLua lsp_quickfix<cr>", "LSP quickfix" },

      -- spits
      ["<S-V>"] = { "<cmd>vs<cr>", "Vertical split" },
      ["<S-H>"] = { "<cmd>sp<cr>", "Horizontal split" },

      -- split.navigation
      ["<S-Up>"] = { "<C-w>k", "Go to upper split" },
      ["<S-Down>"] = { "<C-w>j", "Go to bottom split" },
      ["<S-Right>"] = { "<C-w>l", "Go to right split " },
      ["<S-Left>"] = { "<C-w>h", "Go to left split" },

      -- tabs
      ["<C-t>"] = { "<cmd>$tabnew<cr>", "New tab" },
      ["<C-w>"] = { "<cmd>tabclose<cr>", "Close tab" },
      ["<Tab>"] = { "<cmd>tabn<cr>", "Next tab" },
      ["<S-Tab>"] = { "<cmd>tabp<cr>", "Prev tab" },

      -- plugins hotkeys
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
