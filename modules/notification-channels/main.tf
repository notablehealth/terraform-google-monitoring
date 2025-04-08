

locals {
  # Support secrets in labels
  channel_label_secret_refs = compact(distinct(flatten(
    [
      for channel in var.notification_channels : [
        for label, value in(channel.labels == null ? {} : channel.labels) : [
          value
        ] if value != null && (try(startswith(value, "secret:"), false) == true)
      ]
    ]
  )))
  # Support secrets in sensitive_labels
  channel_slabel_secret_refs = compact(distinct(flatten(
    [
      for channel in var.notification_channels : [
        for label, value in(channel.sensitive_labels == null ? {} : channel.sensitive_labels) : [
          value
        ] if value != null && (try(startswith(value, "secret:"), false) == true)
      ]
    ]
  )))
  channel_secret_refs = concat(local.channel_label_secret_refs, local.channel_slabel_secret_refs)
}

#### .integration_key

### https://handbook.sourcegraph.com/departments/engineering/teams/devops/gcp-slack-notification-terraform/
data "google_secret_manager_secret_version_access" "notification_channels" {
  for_each = toset(local.channel_secret_refs)
  # secret:secret_name
  secret  = split(":", each.key)[1]
  project = var.gcp_project
}
#### .id = .name .project .secret .secret_data .version

resource "google_monitoring_notification_channel" "self" {
  for_each     = { for channel in var.notification_channels : channel.display_name => channel }
  description  = each.value.description
  display_name = each.value.display_name
  enabled      = each.value.enabled
  labels = each.value.labels != null ? { for label, value in(each.value.labels) : label =>
    (lookup(data.google_secret_manager_secret_version_access.notification_channels, value, null) != null ?
      data.google_secret_manager_secret_version_access.notification_channels[value].secret_data
      # else use raw value
    : value)
  } : null

  project     = var.gcp_project
  type        = each.value.type
  user_labels = each.value.user_labels

  dynamic "sensitive_labels" {
    for_each = each.value.sensitive_labels != null ? [each.value.sensitive_labels] : []
    content {
      # one and only 1 of the keys must be specified
      auth_token = (try(each.value.sensitive_labels.auth_token, null) != null ?
        # if secret exists
        (lookup(data.google_secret_manager_secret_version_access.notification_channels, each.value.sensitive_labels.auth_token, null) != null ?
          data.google_secret_manager_secret_version_access.notification_channels[each.value.sensitive_labels.auth_token].secret_data
          # else use raw value
        : each.value.sensitive_labels.auth_token)
        : null
      )
      password = (try(each.value.sensitive_labels.password, null) != null ?
        # if secret exists
        (lookup(data.google_secret_manager_secret_version_access.notification_channels, each.value.sensitive_labels.password, null) != null ?
          data.google_secret_manager_secret_version_access.notification_channels[each.value.sensitive_labels.password].secret_data
          # else use raw value
        : each.value.sensitive_labels.password)
        : null
      )
      service_key = (try(each.value.sensitive_labels.service_key, null) != null ?
        # If secret exists
        (lookup(data.google_secret_manager_secret_version_access.notification_channels, each.value.sensitive_labels.service_key, null) != null ?
          data.google_secret_manager_secret_version_access.notification_channels[each.value.sensitive_labels.service_key].secret_data
          # else use raw value
        : each.value.sensitive_labels.service_key)
        : null
      )

      # These are for debugging
      #auth_token = ((try(each.value.sensitive_labels.password, null) == null) && try(each.value.sensitive_labels.service_key, null) == null
      #  ? "token" : null)
      #password = ((try(each.value.sensitive_labels.auth_token, null) == null) && try(each.value.sensitive_labels.service_key, null) == null
      #  # if secret exists
      #  ? "p"
      #  # else use raw value
      #  : null)
      #service_key = ((try(each.value.sensitive_labels.auth_token, null) == null) && try(each.value.sensitive_labels.password, null) == null
    }
  }
}
