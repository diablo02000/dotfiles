# Workspace dir


To use it, add `workspace-dir` to the  plugins array of your `~/.zshrc` file:

```
plugins=(... workspace-dir)
```

## Requirements

None

## Aliases

| Alias  | Command                                 | Descriptions                                  |
|--------|-----------------------------------------|-----------------------------------------------|
| `cdw`  | `cd ${WORKSPACE_ROOT_DIR}/$(date +%F)`  | Change directory to daily workspace directory |

## Configuration Variables

| Variable  | Description                                        |
|--------|-------------------------------------------------------|
| `WORKSPACE_ROOT_DIR`  | Sets path to workspace base directory  |
