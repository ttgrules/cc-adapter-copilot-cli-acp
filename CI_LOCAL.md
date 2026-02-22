# Local CI Repro Steps

This file shows how to reproduce linting and validation CI jobs locally.

## Prerequisites

- `yamllint`
- `jq`
- `actionlint`

## Reproduce Individual Jobs

### YAML Lint

```bash
yamllint --format github .
```

### Actionlint (Gitea-compatible rules)

```bash
actionlint \
  -ignore 'context "env" is not allowed here' \
  -ignore 'specifying action "https?://.*/gitea-upload-artifact@v4" in invalid format' \
  -ignore 'property "permissions" is not defined in object type.*\[syntax-check\]' \
  -ignore 'SC2001:' \
  .gitea/workflows/ci.yml
```

### JSON Validate

```bash
find . -type f -name '*.json' -not -path './.git/*' -not -path './node_modules/*' -print0 |
  while IFS= read -r -d '' file; do
    echo "Validating ${file}"
    jq empty "${file}"
  done
```
