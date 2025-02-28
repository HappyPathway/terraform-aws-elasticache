resource "aws_elasticache_replication_group" "redis" {
  replication_group_id = var.cluster_id
  description          = "Redis cluster for ${var.cluster_id}"
  engine               = "redis"
  node_type            = var.node_type
  num_cache_clusters   = var.num_cache_nodes
  parameter_group_name = var.parameter_group_name
  port                 = var.port
  subnet_group_name    = aws_elasticache_subnet_group.redis.name
  security_group_ids   = var.security_group_ids

  engine_version             = var.engine_version
  automatic_failover_enabled = var.num_cache_nodes > 1 ? true : false
  multi_az_enabled           = var.num_cache_nodes > 1 ? true : false
  apply_immediately          = var.apply_immediately

  at_rest_encryption_enabled = true
  transit_encryption_enabled = true
  auth_token                 = var.auth_token
  kms_key_id                 = var.kms_key_id

  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  maintenance_window         = var.maintenance_window
  snapshot_retention_limit   = var.snapshot_retention_limit
  snapshot_window            = var.snapshot_window

  tags = var.tags
}

resource "aws_elasticache_subnet_group" "redis" {
  name        = "${var.cluster_id}-subnet-group"
  description = "Subnet group for ${var.cluster_id} Redis cluster"
  subnet_ids  = var.subnet_ids
}
