variable "cluster_id" {
  description = "ID for the Redis cluster"
  type        = string
}

variable "node_type" {
  description = "Instance type for Redis nodes"
  type        = string
  default     = "cache.t3.medium"
}

variable "num_cache_nodes" {
  description = "Number of cache nodes in the cluster"
  type        = number
  default     = 2
}

variable "parameter_group_name" {
  description = "Name of parameter group to use"
  type        = string
  default     = "default.redis7"
}

variable "port" {
  description = "Port number for Redis"
  type        = number
  default     = 6379
}

variable "engine_version" {
  description = "Version number of Redis"
  type        = string
  default     = "7.0"
}

variable "apply_immediately" {
  description = "Whether to apply changes immediately or during maintenance window"
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Whether to automatically upgrade to new minor versions"
  type        = bool
  default     = true
}

variable "maintenance_window" {
  description = "Preferred maintenance window"
  type        = string
  default     = "sun:05:00-sun:07:00"
}

variable "snapshot_retention_limit" {
  description = "Number of days to retain snapshots"
  type        = number
  default     = 7
}

variable "snapshot_window" {
  description = "Daily time range for snapshot creation"
  type        = string
  default     = "03:00-05:00"
}

variable "subnet_ids" {
  description = "List of VPC subnet IDs for the subnet group"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list(string)
}

variable "auth_token" {
  description = "Authentication token for Redis AUTH"
  type        = string
  sensitive   = true
}

variable "kms_key_id" {
  description = "ARN of KMS key for encryption"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
