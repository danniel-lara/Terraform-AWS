output "bucket_name" {
  description = "Nome do bucket criado"
  value       = module.s3_bucket.bucket_name
}

output "bucket_arn" {
  description = "ARN do bucket criado"
  value       = module.s3_bucket.bucket_arn
}
