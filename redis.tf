
resource "aws_elasticache_subnet_group" "redis" {
  name       = "togglemaster-redis-subnets"
  subnet_ids = aws_subnet.private[*].id

  tags = {
    Project = "ToggleMaster"
  }
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id = "togglemaster-redis"
  description          = "Redis do ToggleMaster"

  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_clusters   = 1
  port                 = 6379

  subnet_group_name  = aws_elasticache_subnet_group.redis.name
  security_group_ids = [aws_security_group.redis.id]

  tags = {
    Project = "ToggleMaster"
  }
}
