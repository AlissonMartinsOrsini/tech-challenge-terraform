variable "aws_region" {
  description = "Região AWS do projeto"
  type        = string
  default     = "us-east-1"
}

variable "db_password" {
  description = "Senha dos bancos PostgreSQL"
  type        = string
  sensitive   = true
}