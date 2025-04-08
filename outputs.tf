
#output "output_name" {
#  description = "output value description"
#  value       = # expression or reference to value
#}



# Alert Policies
output "alert_policy_channel_names" {
  description = "Notification channels referenced by alert policies"
  value       = module.alert_policies[*].channel_names
}

# Dashboards
output "dashboards" {
  description = "List of dashboard objects"
  value       = module.dashboards[*].dashboards
}
#output "dashboard_ids" {
#  description = "List of dashboard IDs"
#  value       = module.dashboards[*].ids
#}

# Groups
output "groups_parents" {
  description = "Root parent groups"
  value       = module.groups[*].parents
}
output "groups_subgroups1" {
  description = "Subgroups - level 1"
  value       = module.groups[*].subgroups1
}
output "groups_subgroups2" {
  description = "Subgroups - level 2"
  value       = module.groups[*].subgroups2
}
output "groups_r_subgroups1" {
  description = "Resource: subgroups level 1"
  value       = module.groups[*].r_subgroups1
}
output "groups_r_subgroups2" {
  description = "Resource: subgroups level 2"
  value       = module.groups[*].r_subgroups2
}

# Log Metrics
#output "log_metric_ids" {
#  description = "List of log metric IDs"
#  value       = module.log_metrics[*].ids
#}
output "logging_metrics" {
  description = "All logging metric objects - for debugging"
  value       = module.log_metrics[*].logging_metrics
}

# Logging
output "logging_bucket_config" {
  description = "Full config of the logging bucket config"
  value       = module.logging[*].logging_bucket_config
}

# Metric Descriptors
output "metric_descriptor_names" {
  description = "List of metric descriptor names"
  value       = module.metric_descriptors[*].names
}
output "metric_descriptor_monitored_resource_types" {
  description = "List of metric descriptor monitored resource types"
  value       = module.metric_descriptors[*].monitored_resource_types
}

# Notification Channels
output "notification_channel_secret_refs" {
  description = "List of Google secret manager secret references"
  value       = module.notification_channels[*].channel_secret_refs
}
#output "secrets" {
#  description = "Secrets"
#  value       = module.notification_channels.secrets
#  sensitive   = true
#}

# Project Scope
output "metrics_scope_project" {
  description = "Metrics scope project ID"
  value       = module.project_scope[*].metrics_scope_project
}
#output "metrics_scoped_projects" {
#  description = "Metrics scoped projects. All projects that metrics are being collected from"
#  value       = module.project_scope[*].metrics_scoped_projects
#}
output "metrics_scope_monitored_projects" {
  description = "Monitored projects - Full data for debugging"
  value       = module.project_scope[*].monitored_projects
}
output "metric_scope_projects" {
  description = "GCP project settings before any changes"
  value       = module.project_scope[*].projects
}

# Services
output "service_ids" {
  description = "List of service IDs"
  value       = module.services[*].service_ids
}
output "service_telemetry" {
  description = "List of service telemetry"
  value       = module.services[*].service_telemetry
}
output "custom_service_ids" {
  description = "List of custom service IDs"
  value       = module.services[*].custom_service_ids
}
output "custom_service_telemetry" {
  description = "List of custom service telemetry"
  value       = module.services[*].custom_service_telemetry
}

# SLOs
output "slo_ids" {
  description = "List of SLO IDs"
  value       = module.slo[*].ids
}

# Uptime Checks
output "uptime_check_ids" {
  description = "The IDs of the uptime checks."
  value       = module.uptime_checks[*].ids
}
output "uptime_checks" {
  description = "All uptime checks managed"
  value       = module.uptime_checks[*].uptime_checks
}
