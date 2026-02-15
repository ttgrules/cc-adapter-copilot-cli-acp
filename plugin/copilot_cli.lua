-- Auto-initialization for cc-adapter-copilot-cli-acp extension
-- This file is optional and runs automatically when the plugin is loaded.
-- It ensures the adapter is registered with CodeCompanion.

if vim.g.loaded_cc_adapter_copilot_cli then
  return
end
vim.g.loaded_cc_adapter_copilot_cli = true

-- The adapter will be automatically available as "copilot_cli" in CodeCompanion
-- Users can reference it in their configuration:
--
--   require("codecompanion").setup({
--     adapters = {
--       copilot_cli = function()
--         return require("codecompanion.adapters").extend("copilot_cli", {})
--       end,
--     },
--     interactions = {
--       chat = { adapter = "copilot_cli" },
--     },
--   })
