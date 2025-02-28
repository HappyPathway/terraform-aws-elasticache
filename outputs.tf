output "endpoint" {
  description = "Redis primary endpoint"
  value       = aws_elasticache_replication_group.redis.primary_endpoint_address
}

output "port" {
  description = "Redis port"
  value       = aws_elasticache_replication_group.redis.port
}

output "cluster_id" {
  description = "Redis cluster ID"
  value       = aws_elasticache_replication_group.redis.id
}
