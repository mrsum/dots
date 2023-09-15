return {
  dir = "mrsum/core/autocmds",
  name = "_.mrsum.core.autocmds",
  config = function()
    local _autocmd = vim.api.nvim_create_autocmd
    local _augroup = vim.api.nvim_create_augroup

    _augroup("YankHighlight", { clear = true })

    -- Remove whitespace on save
    _autocmd("BufWritePre", {
      pattern = "",
      command = ":%s/\\s\\+$//e",
    })

    -- Don't auto commenting new lines
    _autocmd("BufEnter", {
      pattern = "",
      command = "set fo-=c fo-=r fo-=o",
    })

    -- Disable line length marker
    _augroup("setLineLength", { clear = true })
    _autocmd("Filetype", {
      group = "setLineLength",
      pattern = { "text", "markdown", "html", "xhtml", "javascript", "typescript" },
      command = "setlocal cc=0",
    })

    -- Open a Terminal on the right tab
    _autocmd("CmdlineEnter", {
      command = "command! Term :botright vsplit term://$SHELL",
    })

    -- Enter insert mode when switching to terminal
    _autocmd("TermOpen", {
      command = "setlocal listchars= nonumber norelativenumber nocursorline",
    })

    _autocmd("TermOpen", {
      pattern = "",
      command = "startinsert",
    })

    -- Close terminal buffer on process exit
    _autocmd("BufLeave", {
      pattern = "term://*",
      command = "stopinsert",
    })

    _autocmd("TextYankPost", {
      pattern = "*",
      callback = function()
        vim.highlight.on_yank()
      end,
      group = vim.api.nvim_create_augroup("YankHighlight", {
        clear = true,
      }),
    })
  end,
}
