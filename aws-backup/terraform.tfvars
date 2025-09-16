aws_region = "us-east-1"
vault_name = "Daily7Retention"

# Configuração de backup
retention_days  = 7
backup_schedule = "cron(0 01 * * ? *)"  # 01:00 UTC (22:00 Brasil)

# Vault Lock (Imutabilidade)
enable_vault_lock           = true
vault_lock_changeable_days  = 7
vault_lock_max_retention    = 7   # Deve ser >= retention_days
vault_lock_min_retention    = 7   # Deve ser <= retention_days

# Tags adicionais (opcional)
additional_tags = {
  DeployBy  = "Terraform"
}