
# Show sensitive values with
#   terraform
#   terraform output -json <output nme>
# nonsensitive(var.mysecret)

output "channel_secret_refs" {
  description = "List of Google secret manager secret references"
  value       = local.channel_secret_refs
}

output "secrets" {
  description = "Secrets"
  value       = data.google_secret_manager_secret_version_access.notification_channels
  sensitive   = true
}
