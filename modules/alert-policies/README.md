# Manage GCP monitoring alert policies

## Permissions needed to modify alert policies

- roles/monitoring.alertPolicyEditor
- roles/monitoring.notificationChannelEditor
- roles/monitoring.snoozeEditor

## Permissions needed to manage incidents

- roles/monitoring.editor

## Permissions needed to view incidents

- roles/monitoring.viewer

Incidents can only be closed in Console GUI or by auto-close rule in alert policy

```shell
gcloud alpha monitoring policies list/describe
gcloud alpha monitoring snoozes create --display-name=snooze-all
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 6.9 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.50.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_monitoring_alert_policy.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_alert_policy) | resource |
| [google_monitoring_notification_channel.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/monitoring_notification_channel) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_policies"></a> [alert\_policies](#input\_alert\_policies) | Alert policy configuration objects | <pre>list(object({<br/>    alert_strategy = optional(object({<br/>      notification_rate_limit = optional(object({<br/>        period = optional(string)<br/>      }))<br/>      auto_close           = optional(string)<br/>      notification_prompts = optional(list(string))<br/>      # This is possibly what the notification_channel_strategy should look like,<br/>      # but the provider docs are a little ambiguous about types. We don't need<br/>      # it yet, in any case.<br/>      # notification_channel_strategy = optional(object({<br/>      #   notification_channel_names = optional(list(string))<br/>      #   renotify_interval = optional(number)<br/>      # }))<br/>    }))<br/>    combiner = string<br/>    conditions = list(object({<br/>      condition_absent = optional(object({<br/>        aggregations = list(object({<br/>          alignment_period     = optional(string)<br/>          cross_series_reducer = optional(string)       # validate<br/>          group_by_fields      = optional(list(string)) # ??<br/>          per_series_aligner   = optional(string)       # validate<br/>        }))<br/>        duration = string # Valid: minutes in seconds: must be /60<br/>        filter   = optional(string)<br/>        trigger = optional(object({<br/>          count   = optional(number)<br/>          percent = optional(number)<br/>        }))<br/>      }))<br/>      condition_matched_log = optional(object({<br/>        filter           = optional(string)<br/>        label_extractors = optional(map(string))<br/>      }))<br/>      condition_monitoring_query_language = optional(object({<br/>        duration                = string<br/>        evaluation_missing_data = optional(string) # validate<br/>        query                   = string<br/>        trigger = optional(object({<br/>          count   = optional(number)<br/>          percent = optional(number)<br/>        }))<br/>      }))<br/>      condition_prometheus_query_language = optional(object({<br/>        query               = string<br/>        duration            = optional(string)<br/>        evaluation_interval = optional(string)<br/>        labels              = optional(map(string))<br/>        rule_group          = optional(string)<br/>        alert_rule          = optional(string)<br/>      }))<br/>      condition_threshold = optional(object({<br/>        aggregations = optional(list(object({<br/>          alignment_period     = optional(string)       # validate<br/>          cross_series_reducer = optional(string)       # validate<br/>          group_by_fields      = optional(list(string)) # ??<br/>          per_series_aligner   = optional(string)       # validate<br/>        })))<br/>        comparison = string # validate [COMPARISON_GT COMPARISON_GE COMPARISON_LT COMPARISON_LE COMPARISON_EQ COMPARISON_NE]<br/>        denominator_aggregations = optional(object({<br/>          alignment_period     = optional(string)<br/>          cross_series_reducer = optional(string) # validate<br/>          group_by_fields      = optional(string) # ??<br/>          per_series_aligner   = optional(string) # validate<br/>        }))<br/>        denominator_filter      = optional(string)<br/>        duration                = string<br/>        evaluation_missing_data = optional(string) # validate<br/>        filter                  = optional(string)<br/>        threshold_value         = optional(number)<br/>        trigger = optional(object({<br/>          count   = optional(number)<br/>          percent = optional(number)<br/>        }))<br/>      }))<br/>      display_name = string<br/>    }))<br/>    display_name = string<br/>    documentation = object({<br/>      content   = string<br/>      mime_type = optional(string, "text/markdown")<br/>      subject   = optional(string)<br/>    })<br/>    enabled               = optional(bool, true)<br/>    notification_channels = optional(list(string), [])<br/>    severity              = optional(string) # validate: CRITICAL, ERROR, WARNING<br/>    user_labels           = optional(map(string))<br/>  }))</pre> | <pre>[<br/>  {<br/>    "combiner": "",<br/>    "conditions": [<br/>      {<br/>        "display_name": ""<br/>      }<br/>    ],<br/>    "display_name": "",<br/>    "documentation": {<br/>      "content": ""<br/>    }<br/>  }<br/>]</pre> | no |
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | GCP project to put monitoring in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_channel_names"></a> [channel\_names](#output\_channel\_names) | Notification channels referenced |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
