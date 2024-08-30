return {
  "David-Kunz/gen.nvim",
  name = "_.mrsum.plugins.ai.code",
  config = function()
    -- Load the gen package and call its setup function with the codellama model and split display mode as arguments.
    local setup, plugin = pcall(require, "gen")
    if not setup then
      return
    end

    plugin.setup({
      model = "codeqwen:latest",
      show_model = true,
      display_mode = "split",
    })

    plugin.prompts["TSDoc"] = {
      prompt = "Add TSDoc to code```$filetype\n...\n```:\n```$filetype\n$text\n```\n",
      replace = false,
      extract = "```$filetype\n(.-)```",
    }

    plugin.prompts["JSDoc"] = {
      prompt = "Add JSDoc to code ```$filetype\n...\n```:\n```$filetype\n$text\n```\n",
      replace = false,
      extract = "```$filetype\n(.-)```",
    }
  end,
}
