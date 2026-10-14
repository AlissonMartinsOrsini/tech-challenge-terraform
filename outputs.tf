
output "rds_endpoints" {
  description = "Endereços dos bancos PostgreSQL"
  value = {
    for service, db in aws_db_instance.postgres :
    service => db.endpoint
  }
}

output "redis_endpoint" {
  description = "Endereço do Redis"
  value       = aws_elasticache_replication_group.redis.primary_endpoint_address
}
