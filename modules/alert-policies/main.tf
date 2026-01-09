
locals {
  channel_names = distinct(flatten([for policy in var.alert_policies : policy.notification_channels]))
}

# create list of all channels used -> loop
data "google_monitoring_notification_channel" "self" {
  for_each     = toset(local.channel_names) # wrong - need notification channel display_name instead - Fixing data, then this should be ok
  project      = var.gcp_project
  display_name = each.key
  # type, labels, .user_labels(optional)
}
#notification_channels = [data.google_monitoring_notification_channel.self[]]

resource "google_monitoring_alert_policy" "self" {
  for_each = { for policy in var.alert_policies : policy.display_name => policy }
  combiner = each.value.combiner
  project  = var.gcp_project
  dynamic "alert_strategy" {
    for_each = each.value.alert_strategy == null ? [] : [each.value.alert_strategy]
    content {
      auto_close = alert_strategy.value["auto_close"]
      dynamic "notification_rate_limit" {
        for_each = alert_strategy.value["notification_rate_limit"] == null ? [] : [alert_strategy.value["notification_rate_limit"]]
        content {
          period = notification_rate_limit.value["period"]
        }
      }
    }
  }
  dynamic "conditions" {
    for_each = each.value.conditions
    content {
      display_name = conditions.value["display_name"]
      # These need to be blocks - dynamic to support defined or not
      dynamic "condition_absent" {
        for_each = conditions.value["condition_absent"] == null ? [] : [conditions.value["condition_absent"]]
        content {
          dynamic "aggregations" {
            for_each = condition_absent.value["aggregations"]
            content {
              alignment_period     = aggregations.value["alignment_period"]
              cross_series_reducer = aggregations.value["cross_series_reducer"]
              group_by_fields      = aggregations.value["group_by_fields"]
              per_series_aligner   = aggregations.value["per_series_aligner"]
            }
          }
          duration = condition_absent.value["duration"]
          filter   = condition_absent.value["filter"]
          dynamic "trigger" {
            for_each = try(condition_absent.value["trigger"], null) == null ? [] : [condition_absent.value["trigger"]]
            content {
              count   = trigger.value["count"]
              percent = trigger.value["percent"]
            }
          }
        }
      } # END condition_absent
      dynamic "condition_prometheus_query_language" {
        for_each = conditions.value["condition_prometheus_query_language"] == null ? [] : [conditions.value["condition_prometheus_query_language"]]
        content {
          query               = condition_prometheus_query_language.value["query"]
          duration            = condition_prometheus_query_language.value["duration"]
          evaluation_interval = condition_prometheus_query_language.value["evaluation_interval"]
          labels              = condition_prometheus_query_language.value["labels"]
          rule_group          = condition_prometheus_query_language.value["rule_group"]
          alert_rule          = condition_prometheus_query_language.value["alert_rule"]
        }
      } # END condition_prometheus_query_language
      dynamic "condition_monitoring_query_language" {
        for_each = conditions.value["condition_monitoring_query_language"] == null ? [] : [conditions.value["condition_monitoring_query_language"]]
        content {
          query    = condition_monitoring_query_language.value["query"]
          duration = condition_monitoring_query_language.value["duration"]
        }
      } # END condition_monitoring_query_language
      dynamic "condition_threshold" {
        for_each = try(conditions.value["condition_threshold"], null) == null ? [] : [conditions.value["condition_threshold"]]
        content {
          dynamic "aggregations" {
            for_each = condition_threshold.value["aggregations"]
            content {
              alignment_period     = aggregations.value["alignment_period"]
              cross_series_reducer = aggregations.value["cross_series_reducer"]
              group_by_fields      = aggregations.value["group_by_fields"]
              per_series_aligner   = aggregations.value["per_series_aligner"]
            }
          }
          comparison = condition_threshold.value["comparison"]
          dynamic "denominator_aggregations" {
            for_each = try(conditions.value["denominator_aggregations"], null) == null ? [] : [conditions.value["denominator_aggregations"]]
            content {
              alignment_period     = denominator_aggregations.value["alignment_period"]
              cross_series_reducer = denominator_aggregations.value["cross_series_reducer"]
              group_by_fields      = denominator_aggregations.value["group_by_fields"]
              per_series_aligner   = denominator_aggregations.value["per_series_aligner"]
            }
          }
          denominator_filter      = condition_threshold.value["denominator_filter"]
          duration                = condition_threshold.value["duration"]
          evaluation_missing_data = condition_threshold.value["evaluation_missing_data"]
          filter                  = condition_threshold.value["filter"]
          threshold_value         = condition_threshold.value["threshold_value"]
          dynamic "trigger" {
            for_each = try(condition_threshold.value["trigger"], null) == null ? [] : [condition_threshold.value["trigger"]]
            content {
              count   = trigger.value["count"]
              percent = trigger.value["percent"]
            }
          }
        }
      } # END condition_threshold
      dynamic "condition_matched_log" {
        for_each = conditions.value["condition_matched_log"] == null ? [] : [conditions.value["condition_matched_log"]]
        content {
          filter           = condition_matched_log.value["filter"]
          label_extractors = lookup(condition_matched_log.value, "label_extractors", null)
        }
      } # END condition_matched_log
    }
  } # END conditions
  display_name = each.value.display_name
  documentation {
    content   = each.value.documentation["content"]
    mime_type = each.value.documentation["mime_type"]
    #subject   = each.value.documentation["subject"]
  }
  enabled               = each.value.enabled
  notification_channels = [for name in each.value.notification_channels : data.google_monitoring_notification_channel.self[name].name]
  severity              = each.value.severity
  user_labels           = each.value.user_labels
}
