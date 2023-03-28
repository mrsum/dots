local setup, blamer = pcall(require, "blamer")
if not setup then
  return
end

blamer.setup({})
