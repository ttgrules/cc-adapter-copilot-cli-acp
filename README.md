# cc-adapter-copilot-cli-acp

CodeCompanion.nvim extension for GitHub Copilot CLI's ACP (Agent Client Protocol) server.

## Overview

This adapter enables CodeCompanion.nvim to communicate with GitHub Copilot CLI via the standardized Agent Client Protocol (ACP). The Copilot CLI acts as an ACP-compliant agent that can be integrated into your development workflow.

## Requirements

- **GitHub Copilot CLI**: Must be installed and authenticated. See [GitHub Copilot CLI documentation](https://docs.github.com/en/copilot/reference/copilot-cli)
- **CodeCompanion.nvim**: The Neovim plugin that this adapter extends

## Installation

### Using lazy.nvim (Recommended)

Add this repository as a dependency to CodeCompanion:

```lua
{
  "olimorris/codecompanion.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-lua/plenary.nvim",
    -- Copilot CLI ACP Adapter
    "JohnHunt/cc-adapter-copilot-cli-acp",
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        copilot_cli = function()
          return require("codecompanion.adapters").extend("copilot_cli", {})
        end,
      },
      interactions = {
        chat = {
          adapter = "copilot_cli",
        },
      },
    })
  end,
}
```

### Manual Installation

1. Clone this repository to your Neovim config:
   ```bash
   git clone https://github.com/JohnHunt/cc-adapter-copilot-cli-acp ~/.config/nvim/pack/plugins/start/cc-adapter-copilot-cli-acp
   ```

2. Configure CodeCompanion to use the Copilot CLI adapter:
   ```lua
   require("codecompanion").setup({
     adapters = {
       copilot_cli = function()
         return require("codecompanion.adapters").extend("copilot_cli", {})
       end,
     },
     interactions = {
       chat = {
         adapter = "copilot_cli",
       },
     },
   })
   ```

## Configuration

The adapter works out-of-the-box with sensible defaults. You can customize settings when extending:

```lua
require("codecompanion").setup({
  adapters = {
    copilot_cli = function()
      return require("codecompanion.adapters").extend("copilot_cli", {
        defaults = {
          mcpServers = {},  -- Add MCP servers if needed
          timeout = 20000,  -- 20 seconds
        },
      })
    end,
  },
})
```

### Configuration Options

- **timeout**: Request timeout in milliseconds (default: 20000)
- **mcpServers**: Array of MCP (Model Context Protocol) servers to integrate (default: empty)

## How It Works

The adapter communicates with Copilot CLI in stdio mode, which:
- Pipes all ACP protocol messages through standard input/output
- Enables seamless integration with Neovim and other IDEs
- Is the recommended mode for IDE integration per ACP specification

Messages are formatted according to the ACP protocol specification and sent to Copilot CLI, which processes them and returns structured responses.

## Protocol Compliance

This adapter implements the standardized Agent Client Protocol as documented at [agentclientprotocol.com](https://agentclientprotocol.com/). For complete ACP documentation, refer to the [official ACP introduction](https://agentclientprotocol.com/get-started/introduction).

## Support

For issues or questions:
- Check the [CodeCompanion.nvim documentation](https://codecompanion.olimorris.dev/)
- Review the [Copilot CLI ACP documentation](https://docs.github.com/en/copilot/reference/acp-server)
- Consult the [ACP protocol specifications](https://agentclientprotocol.com/protocol/overview)
- Open an issue on this repository

## License

See the [LICENSE](LICENSE) file for details.

