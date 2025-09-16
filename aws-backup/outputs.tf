output "vault_info" {
  description = "Informações do Backup Vault criado"
  value = {
    name = aws_backup_vault.vault.name
    arn  = aws_backup_vault.vault.arn
  }
}

output "plan_info" {
  description = "Informações do Backup Plan criado"
  value = {
    name = aws_backup_plan.plan.name
    id   = aws_backup_plan.plan.id
    arn  = aws_backup_plan.plan.arn
  }
}

output "assignment_info" {
  description = "Informações do Resource Assignment criado"
  value = {
    name     = aws_backup_selection.assignment.name
    id       = aws_backup_selection.assignment.id
    iam_role = aws_backup_selection.assignment.iam_role_arn
    tag_key  = "AWSBKP"
    tag_value = var.vault_name
  }
}

output "backup_configuration" {
  description = "Resumo da configuração de backup"
  value = {
    vault_name         = var.vault_name
    retention_days     = var.retention_days
    backup_schedule    = var.backup_schedule
    vault_lock_enabled = var.enable_vault_lock
    region             = var.aws_region
    assignment_name    = aws_backup_selection.assignment.name
    status             = "Vault, Plan e Assignment criados - Pronto para usar!"
  }
}

output "ec2_tag_info" {
  description = "Tag que deve ser aplicada nas EC2s para backup automático"
  value = {
    tag_key   = "AWSBKP"
    tag_value = var.vault_name
    example   = "Adicione a tag AWSBKP=${var.vault_name} nas EC2s"
  }
}

output "vault_lock_status" {
  description = "Status do Vault Lock"
  value = {
    enabled             = var.enable_vault_lock
    changeable_for_days = var.enable_vault_lock ? var.vault_lock_changeable_days : null
    max_retention       = var.enable_vault_lock ? var.vault_lock_max_retention : null
    min_retention       = var.enable_vault_lock ? var.vault_lock_min_retention : null
  }
}
