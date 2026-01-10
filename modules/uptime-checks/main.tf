
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_uptime_check_config
resource "google_monitoring_uptime_check_config" "self" {
  for_each           = { for check in var.uptime_checks : check.display_name => check }
  checker_type       = each.value.checker_type
  display_name       = each.value.display_name
  period             = each.value.period
  project            = var.gcp_project
  selected_regions   = each.value.selected_regions
  timeout            = each.value.timeout
  log_check_failures = each.value.log_check_failures
  dynamic "content_matchers" {
    for_each = each.value.content_matchers != null ? [each.value.content_matchers] : []
    content {
      content = content_matchers.value.content
      matcher = content_matchers.value.matcher
      dynamic "json_path_matcher" {
        for_each = try(content_matchers.value.json_path_matcher, null) != null ? [content_matchers.value.json_path_matcher] : []
        content {
          json_matcher = json_path_matcher.value.json_matcher
          json_path    = json_path_matcher.value.json_path
        }
      }
    }
  }
  dynamic "http_check" {
    for_each = each.value.http_check != null ? [each.value.http_check] : []
    content {
      body           = http_check.value.body
      content_type   = http_check.value.content_type
      headers        = http_check.value.headers
      mask_headers   = try(http_check.value.mask_headers, null) != null ? http_check.value.mask_headers : null
      path           = http_check.value.path
      port           = http_check.value.port
      request_method = http_check.value.request_method
      use_ssl        = http_check.value.use_ssl
      validate_ssl   = http_check.value.validate_ssl
      dynamic "accepted_response_status_codes" {
        for_each = try(http_check.value.accepted_response_status_codes, null) != null ? http_check.value.accepted_response_status_codes : []
        content {
          status_class = accepted_response_status_codes.value.status_class
          status_value = accepted_response_status_codes.value.status_value
        }
      }
      dynamic "auth_info" {
        for_each = try(http_check.value.auth_info, null) != null ? [http_check.value.auth_info] : []
        content {
          password = auth_info.value.password
          username = auth_info.value.username
        }
      }
    }
  }
  dynamic "monitored_resource" {
    for_each = try(each.value.monitored_resource, null) != null ? [each.value.monitored_resource] : []
    content {
      labels = monitored_resource.value.labels
      type   = monitored_resource.value.type
    }
  }
  dynamic "resource_group" {
    for_each = try(each.value.resource_group, null) != null ? [each.value.resource_group] : []
    content {
      group_id      = resource_group.value.group_id
      resource_type = resource_group.value.resource_type
    }
  }
  dynamic "tcp_check" {
    for_each = try(each.value.tcp_check, null) != null ? [each.value.tcp_check] : []
    content {
      port = tcp_check.value.port
    }
  }
}
