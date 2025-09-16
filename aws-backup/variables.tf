variable "aws_region" {
  description = "Região AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "vault_name" {
  description = "Nome do Backup Vault"
  type        = string
  validation {
    condition     = length(var.vault_name) > 0
    error_message = "O nome do vault não pode estar vazio."
  }
}

variable "retention_days" {
  description = "Número de dias para manter os backups"
  type        = number
  default     = 7
  validation {
    condition     = var.retention_days > 0 && var.retention_days <= 35064
    error_message = "Retenção deve ser entre 1 e 35064 dias."
  }
}

variable "backup_schedule" {
  description = "Cronograma do backup em formato cron"
  type        = string
  default     = "cron(0 01 * * ? *)"  # 01:00 UTC diariamente
}

variable "enable_vault_lock" {
  description = "Habilitar Vault Lock (imutabilidade dos backups)"
  type        = bool
  default     = true
}

variable "vault_lock_changeable_days" {
  description = "Dias em que o vault lock pode ser alterado após criação"
  type        = number
  default     = 3
  validation {
    condition     = var.vault_lock_changeable_days >= 3 && var.vault_lock_changeable_days <= 36500
    error_message = "Changeable days deve ser entre 3 e 36500 dias."
  }
}

variable "vault_lock_max_retention" {
  description = "Retenção máxima permitida pelo vault lock (deve ser >= retention_days)"
  type        = number
  default     = null
}

variable "vault_lock_min_retention" {
  description = "Retenção mínima exigida pelo vault lock (deve ser <= retention_days)"  
  type        = number
  default     = null
}

variable "additional_tags" {
  description = "Tags adicionais para aplicar aos recursos"
  type        = map(string)
  default     = {}
}