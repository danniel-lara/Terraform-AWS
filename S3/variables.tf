variable "aws_region" {
  description = "Região da AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Nome único do bucket S3"
  type        = string
}

variable "environment" {
  description = "Ambiente do bucket (dev, staging, prod)"
  type        = string
  default     = "dev"
}
