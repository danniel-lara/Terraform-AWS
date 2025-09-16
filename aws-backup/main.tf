terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.13.0"
    }
  }
}

# Provider AWS
provider "aws" {
  region = var.aws_region
}

# Data sources
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

# AWS Backup Vault
resource "aws_backup_vault" "vault" {
  name = var.vault_name
  
  tags = merge({
    Name        = var.vault_name
    DeployBy   = "Terraform"
  }, var.additional_tags)
}

# AWS Backup Plan
resource "aws_backup_plan" "plan" {
  name = "${var.vault_name}-plan"
  
  rule {
    rule_name         = var.vault_name
    target_vault_name = aws_backup_vault.vault.name
    schedule          = var.backup_schedule
    
    lifecycle {
      delete_after = var.retention_days
    }
    
    recovery_point_tags = {
      BackupRule = var.vault_name
      Retention  = "${var.retention_days}days"
    }
  }
  
  # Configuração avançada para Windows VSS
  advanced_backup_setting {
    backup_options = {
      WindowsVSS = "enabled"
    }
    resource_type = "EC2"
  }
  
  tags = {
    Name = "${var.vault_name}-plan"
  }
}

# AWS Backup Selection (Resource Assignment)
resource "aws_backup_selection" "assignment" {
  name         = "TAG_AWSBKP-${var.vault_name}"
  iam_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/service-role/AWSBackupDefaultServiceRole"
  plan_id      = aws_backup_plan.plan.id
  
  # Seleciona TODOS os recursos que tenham a tag especificada
  selection_tag {
    type  = "STRINGEQUALS"
    key   = "AWSBKP"
    value = var.vault_name
  }
  
  # Pode adicionar recursos específicos por ARN se necessário
  # resources = ["arn:aws:ec2:*"]  # Opcional: especificar ARNs
}

# AWS Backup Vault Lock (Imutabilidade)
resource "aws_backup_vault_lock_configuration" "vault_lock" {
  count = var.enable_vault_lock ? 1 : 0
  
  backup_vault_name   = aws_backup_vault.vault.name
  changeable_for_days = var.vault_lock_changeable_days
  max_retention_days  = var.vault_lock_max_retention
  min_retention_days  = var.vault_lock_min_retention
}