# Terragrunt plugin

Plugin for Terragrunt, a wrapper that provides extra tools for keeping your configurations DRY, working with multiple Terraform modules,
and managing remote state. It add aliases for `terragrunt`

To use it, add `terragrunt` to the  plugins array of your `~/.zshrc` file:

```
plugins=(... terragrunt)
```

## Requirements

* [terragrunt](https://terragrunt.gruntwork.io/)

## Aliases

| Alias | Command              |
|-------|----------------------|
| `tg`  | `terragrunt`         |
| `tga` | `terragrunt apply`   |
| `tgc` | `terraform console`  |
| `tgd` | `terraform destroy`  |
| `tgf` | `terraform fmt`      |
| `tgi` | `terraform init`     |
| `tgo` | `terraform output`   |
| `tgp` | `terraform plan`     |
| `tgv` | `terraform validate` |
| `tgs` | `terraform state`    |
| `tgsh`| `terraform show`     |
