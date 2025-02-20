<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.87.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | ./modules/s3_bucket | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | Região da AWS onde os recursos serão criados | `string` | `"us-east-1"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Nome único do bucket S3 | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Ambiente do bucket (dev, staging, prod) | `string` | `"dev"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | ARN do bucket criado |
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | Nome do bucket criado |
<!-- END_TF_DOCS -->