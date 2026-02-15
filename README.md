# codecompanion-copilot-cli-acp

CodeCompanion.nvim extension for GitHub Copilot CLI's ACP (Agent Client Protocol) server.

## Overview

This adapter enables CodeCompanion.nvim to communicate with GitHub Copilot CLI via the standardized Agent Client Protocol (ACP). The Copilot CLI acts as an ACP-compliant agent that can be integrated into your development workflow.

## Requirements

- **GitHub Copilot CLI**: Must be installed and authenticated. See [GitHub Copilot CLI documentation](https://docs.github.com/en/copilot/reference/copilot-cli)
- **CodeCompanion.nvim**: The Neovim plugin that this adapter extends

## Installation

1. Ensure the adapter files are in your CodeCompanion.nvim adapters directory:
   ```
   lua/codecompanion/adapters/acp/init.lua
   lua/codecompanion/adapters/acp/helpers.lua
   ```

2. Configure CodeCompanion to use the Copilot CLI adapter in your setup:
   ```lua
   require("codecompanion").setup({
     adapters = {
       acp = {
         copilot_cli = "copilot_cli",
       },
     },
   })
   ```

3. Set the adapter as your default:
   ```lua
   require("codecompanion").setup({
     interactions = {
       chat = {
         adapter = "copilot_cli",
       },
     },
   })
   ```

## Configuration

The adapter uses the following defaults:

- **Command**: `copilot --acp --stdio` (uses standard input/output for transport)
- **Protocol Version**: 1 (ACP Protocol v1)
- **Timeout**: 20 seconds
- **Vision Support**: Enabled

## How It Works

The adapter communicates with Copilot CLI in stdio mode, which:
- Pipes all ACP protocol messages through standard input/output
- Enables seamless integration with IDEs and editors
- Is the recommended mode for IDE integration per ACP specification

Messages are formatted according to the ACP protocol specification and sent to Copilot CLI, which processes them and returns structured responses.

## Protocol Compliance

This adapter implements the standardized Agent Client Protocol as documented at [agentclientprotocol.com](https://agentclientprotocol.com/). For complete ACP documentation, refer to the [official ACP introduction](https://agentclientprotocol.com/get-started/introduction).

## Support

For issues or questions:
- Check the [CodeCompanion.nvim documentation](https://codecompanion.olimorris.dev/)
- Review the [Copilot CLI ACP documentation](https://docs.github.com/en/copilot/reference/acp-server)
- Consult the [ACP protocol specifications](https://agentclientprotocol.com/protocol/overview)
