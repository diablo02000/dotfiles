# shellcheck disable=SC2148
# --- Terragrunt Aliases ---
# tg: Run Terragrunt command
alias tg='terragrunt'

# tga: Apply HCL files
alias tga='terragrunt apply'

# tgc: Start Terragrunt console
alias tgc='terragrunt console'

# tgd: Destroy resources defined in HCL file
alias tgd='terragrunt destroy'

# tgf: Format HCL file
alias tgf='terragrunt hclfmt'

# tgi: Initialize Terragrunt project
alias tgi='terragrunt init'

# tgo: Retrieve and interact with outputs
alias tgo='terragrunt stack output'

# tgp: Show planned changes
alias tgp='terragrunt plan'

# tgpr: Show the providers reauired for this configuration
alias tgpr='terragrunt providers'

# tgr: Update the state to match remote systems
alias tgr='terragrunt refresh'

# tgs: Interact with Terragrunt state
alias tgs='terragrunt state'

# tgsc: Remove `.terragrunt-stack` directory
alias tgsc='terragrunt stack clean'

# tgsh: Show current Terragrunt state or plan
alias tgsh='terragrunt show'

# tgv: Validate HCL files
alias tgv='terragrunt hcl validate'
