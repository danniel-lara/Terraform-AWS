<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.13.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.13.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_backup_plan.plan](https://registry.terraform.io/providers/hashicorp/aws/6.13.0/docs/resources/backup_plan) | resource |
| [aws_backup_selection.assignment](https://registry.terraform.io/providers/hashicorp/aws/6.13.0/docs/resources/backup_selection) | resource |
| [aws_backup_vault.vault](https://registry.terraform.io/providers/hashicorp/aws/6.13.0/docs/resources/backup_vault) | resource |
| [aws_backup_vault_lock_configuration.vault_lock](https://registry.terraform.io/providers/hashicorp/aws/6.13.0/docs/resources/backup_vault_lock_configuration) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/6.13.0/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/6.13.0/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | Tags adicionais para aplicar aos recursos | `map(string)` | `{}` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Região AWS onde os recursos serão criados | `string` | `"us-east-1"` | no |
| <a name="input_backup_schedule"></a> [backup\_schedule](#input\_backup\_schedule) | Cronograma do backup em formato cron | `string` | `"cron(0 01 * * ? *)"` | no |
| <a name="input_enable_vault_lock"></a> [enable\_vault\_lock](#input\_enable\_vault\_lock) | Habilitar Vault Lock (imutabilidade dos backups) | `bool` | `true` | no |
| <a name="input_retention_days"></a> [retention\_days](#input\_retention\_days) | Número de dias para manter os backups | `number` | `7` | no |
| <a name="input_vault_lock_changeable_days"></a> [vault\_lock\_changeable\_days](#input\_vault\_lock\_changeable\_days) | Dias em que o vault lock pode ser alterado após criação | `number` | `3` | no |
| <a name="input_vault_lock_max_retention"></a> [vault\_lock\_max\_retention](#input\_vault\_lock\_max\_retention) | Retenção máxima permitida pelo vault lock (deve ser >= retention\_days) | `number` | `null` | no |
| <a name="input_vault_lock_min_retention"></a> [vault\_lock\_min\_retention](#input\_vault\_lock\_min\_retention) | Retenção mínima exigida pelo vault lock (deve ser <= retention\_days) | `number` | `null` | no |
| <a name="input_vault_name"></a> [vault\_name](#input\_vault\_name) | Nome do Backup Vault | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_assignment_info"></a> [assignment\_info](#output\_assignment\_info) | Informações do Resource Assignment criado |
| <a name="output_backup_configuration"></a> [backup\_configuration](#output\_backup\_configuration) | Resumo da configuração de backup |
| <a name="output_ec2_tag_info"></a> [ec2\_tag\_info](#output\_ec2\_tag\_info) | Tag que deve ser aplicada nas EC2s para backup automático |
| <a name="output_plan_info"></a> [plan\_info](#output\_plan\_info) | Informações do Backup Plan criado |
| <a name="output_vault_info"></a> [vault\_info](#output\_vault\_info) | Informações do Backup Vault criado |
| <a name="output_vault_lock_status"></a> [vault\_lock\_status](#output\_vault\_lock\_status) | Status do Vault Lock |
<!-- END_TF_DOCS -->