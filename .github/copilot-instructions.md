# Copilot Instructions for `cc-adapter-copilot-cli-acp`

## Repository focus

- Lua adapter for CodeCompanion.nvim to communicate with Copilot CLI ACP server.
- Main code lives in Lua files; Node tooling is for release only.

## Read first for this repo

1. `README.md`
2. `.gitea/workflows/ci.yml`
3. `package.json`

## CI-aligned validation commands

```bash
find . -type f -name '*.json' -not -path './.git/*' -not -path './node_modules/*' -print0 | while IFS= read -r -d '' file; do jq empty "${file}"; done
npx --yes prettier --check "**/*.{json,md,mjs}"
find . -type f -name '*.lua' -not -path './.git/*' -print0 | while IFS= read -r -d '' file; do luac5.1 -p "${file}"; done
stylua --check .
```

## Repo-specific notes

- Keep adapter configuration examples in `README.md` aligned with code changes.
