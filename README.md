<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
# terraform-google-monitoring

[![Releases](https://img.shields.io/github/v/release/notablehealth/terraform-google-monitoring)](https://github.com/notablehealth/terraform-google-monitoring/releases)

[Terraform Module Registry](https://registry.terraform.io/modules/notablehealth/monitoring/google)

Module for managing Google Cloud Monitoring

## Features

- Goal is to support all Google Cloud Monitoring resources that Terraform supports
- Submodules can be called directly
- Wrapper module to call all submodules

## Submodules

Submodules can be used directly. Some may not be included in the root wrapper module.

- [Submodules](modules/README.md)

## Usage
Basic usage of this module is as follows:

```hcl
module "example" {
    source = "notablehealth/<module>/google"
    # Recommend pinning every module to a specific version
    # version = "x.x.x"

    # Required variables
        gcp_project =
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.7 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alert_policies"></a> [alert\_policies](#module\_alert\_policies) | ./modules/alert-policies | n/a |
| <a name="module_dashboards"></a> [dashboards](#module\_dashboards) | ./modules/dashboards | n/a |
| <a name="module_groups"></a> [groups](#module\_groups) | ./modules/groups | n/a |
| <a name="module_log_metrics"></a> [log\_metrics](#module\_log\_metrics) | ./modules/log-metrics | n/a |
| <a name="module_logging"></a> [logging](#module\_logging) | ./modules/logging | n/a |
| <a name="module_metric_descriptors"></a> [metric\_descriptors](#module\_metric\_descriptors) | ./modules/metric-descriptors | n/a |
| <a name="module_notification_channels"></a> [notification\_channels](#module\_notification\_channels) | ./modules/notification-channels | n/a |
| <a name="module_project_scope"></a> [project\_scope](#module\_project\_scope) | ./modules/project-scope | n/a |
| <a name="module_services"></a> [services](#module\_services) | ./modules/services | n/a |
| <a name="module_slo"></a> [slo](#module\_slo) | ./modules/slo | n/a |
| <a name="module_uptime_checks"></a> [uptime\_checks](#module\_uptime\_checks) | ./modules/uptime-checks | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_policies"></a> [alert\_policies](#input\_alert\_policies) | Alert policy configuration objects | <pre>list(object({<br/>    alert_strategy = optional(object({<br/>      notification_rate_limit = optional(object({<br/>        period = optional(string)<br/>      }))<br/>      auto_close           = optional(string)<br/>      notification_prompts = optional(list(string))<br/>      # This is possibly what the notification_channel_strategy should look like,<br/>      # but the provider docs are a little ambiguous about types. We don't need<br/>      # it yet, in any case.<br/>      # notification_channel_strategy = optional(object({<br/>      #   notification_channel_names = optional(list(string))<br/>      #   renotify_interval = optional(number)<br/>      # }))<br/>    }))<br/>    combiner = string<br/>    conditions = list(object({<br/>      condition_absent = optional(object({<br/>        aggregations = list(object({<br/>          alignment_period     = optional(string)<br/>          cross_series_reducer = optional(string)       # validate<br/>          group_by_fields      = optional(list(string)) # ??<br/>          per_series_aligner   = optional(string)       # validate<br/>        }))<br/>        duration = string # Valid: minutes in seconds: must be /60<br/>        filter   = optional(string)<br/>        trigger = optional(object({<br/>          count   = optional(number)<br/>          percent = optional(number)<br/>        }))<br/>      }))<br/>      condition_matched_log = optional(object({<br/>        filter           = optional(string)<br/>        label_extractors = optional(map(string))<br/>      }))<br/>      condition_monitoring_query_language = optional(object({<br/>        duration                = string<br/>        evaluation_missing_data = optional(string) # validate<br/>        query                   = string<br/>        trigger = optional(object({<br/>          count   = optional(number)<br/>          percent = optional(number)<br/>        }))<br/>      }))<br/>      condition_prometheus_query_language = optional(object({<br/>        query               = string<br/>        duration            = optional(string)<br/>        evaluation_interval = optional(string)<br/>        labels              = optional(map(string))<br/>        rule_group          = optional(string)<br/>        alert_rule          = optional(string)<br/>      }))<br/>      condition_threshold = optional(object({<br/>        aggregations = optional(list(object({<br/>          alignment_period     = optional(string)       # validate<br/>          cross_series_reducer = optional(string)       # validate<br/>          group_by_fields      = optional(list(string)) # ??<br/>          per_series_aligner   = optional(string)       # validate<br/>        })))<br/>        comparison = string # validate [COMPARISON_GT COMPARISON_GE COMPARISON_LT COMPARISON_LE COMPARISON_EQ COMPARISON_NE]<br/>        denominator_aggregations = optional(object({<br/>          alignment_period     = optional(string)<br/>          cross_series_reducer = optional(string) # validate<br/>          group_by_fields      = optional(string) # ??<br/>          per_series_aligner   = optional(string) # validate<br/>        }))<br/>        denominator_filter      = optional(string)<br/>        duration                = string<br/>        evaluation_missing_data = optional(string) # validate<br/>        filter                  = optional(string)<br/>        threshold_value         = optional(number)<br/>        trigger = optional(object({<br/>          count   = optional(number)<br/>          percent = optional(number)<br/>        }))<br/>      }))<br/>      display_name = string<br/>    }))<br/>    display_name = string<br/>    documentation = object({<br/>      content   = string<br/>      mime_type = optional(string, "text/markdown")<br/>      subject   = optional(string)<br/>    })<br/>    enabled               = optional(bool, true)<br/>    notification_channels = optional(list(string), [])<br/>    severity              = optional(string) # validate: CRITICAL, ERROR, WARNING<br/>    user_labels           = optional(map(string))<br/>  }))</pre> | <pre>[<br/>  {<br/>    "combiner": "",<br/>    "conditions": [<br/>      {<br/>        "display_name": ""<br/>      }<br/>    ],<br/>    "display_name": "",<br/>    "documentation": {<br/>      "content": ""<br/>    }<br/>  }<br/>]</pre> | no |
| <a name="input_custom_services"></a> [custom\_services](#input\_custom\_services) | List of Custom Service configuration objects | <pre>list(object({<br/>    display_name = optional(string)<br/>    service_id   = optional(string)<br/>    telemetry = optional(object({<br/>      resource_name = optional(string)<br/>    }))<br/>    user_labels = optional(map(string))<br/>  }))</pre> | `[]` | no |
| <a name="input_dashboard_sources_path"></a> [dashboard\_sources\_path](#input\_dashboard\_sources\_path) | Path to process dashboard source files | `string` | `""` | no |
| <a name="input_dashboard_sources_pattern"></a> [dashboard\_sources\_pattern](#input\_dashboard\_sources\_pattern) | Dashboard json files pattern | `string` | `"**"` | no |
| <a name="input_enable_alert_policies"></a> [enable\_alert\_policies](#input\_enable\_alert\_policies) | Enable managing Alert Polices | `bool` | `false` | no |
| <a name="input_enable_dashboards"></a> [enable\_dashboards](#input\_enable\_dashboards) | Enable managing Dashboards | `bool` | `false` | no |
| <a name="input_enable_groups"></a> [enable\_groups](#input\_enable\_groups) | Enable managing Groups | `bool` | `false` | no |
| <a name="input_enable_log_metrics"></a> [enable\_log\_metrics](#input\_enable\_log\_metrics) | Enable managing Log Metrics | `bool` | `false` | no |
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | Enable managing central Logging | `bool` | `false` | no |
| <a name="input_enable_metric_descriptors"></a> [enable\_metric\_descriptors](#input\_enable\_metric\_descriptors) | Enable managing Metric Descriptors | `bool` | `false` | no |
| <a name="input_enable_notification_channels"></a> [enable\_notification\_channels](#input\_enable\_notification\_channels) | Enable managing Notification Channels | `bool` | `false` | no |
| <a name="input_enable_project_scope"></a> [enable\_project\_scope](#input\_enable\_project\_scope) | Enable managing Project metric scopes | `bool` | `false` | no |
| <a name="input_enable_services"></a> [enable\_services](#input\_enable\_services) | Enable managing Services | `bool` | `false` | no |
| <a name="input_enable_slo"></a> [enable\_slo](#input\_enable\_slo) | Enable managing SLOs | `bool` | `false` | no |
| <a name="input_enable_uptime_checks"></a> [enable\_uptime\_checks](#input\_enable\_uptime\_checks) | Enable managing Uptime Checks | `bool` | `false` | no |
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | GCP project to put monitoring in | `string` | n/a | yes |
| <a name="input_groups"></a> [groups](#input\_groups) | List of group confiiguration object | <pre>list(object({<br/>    display_name = string<br/>    filter       = string<br/>    is_cluster   = optional(bool)<br/>    parent_name  = optional(string)<br/>  }))</pre> | <pre>[<br/>  {<br/>    "display_name": "",<br/>    "filter": ""<br/>  }<br/>]</pre> | no |
| <a name="input_logging_bucket"></a> [logging\_bucket](#input\_logging\_bucket) | Logging Bucket name | `string` | `""` | no |
| <a name="input_logging_metrics"></a> [logging\_metrics](#input\_logging\_metrics) | List of logging metric configuration objects | <pre>list(object({<br/>    name        = string<br/>    bucket_name = optional(string)<br/>    bucket_options = optional(object({<br/>      explicit_buckets = optional(object({<br/>        bounds = string<br/>      }))<br/>      exponential_buckets = optional(object({<br/>        growth_factor      = optional(number)<br/>        num_finite_buckets = optional(number)<br/>        scale              = optional(number)<br/>      }))<br/>      linear_buckets = optional(object({<br/>        num_finite_buckets = optional(number)<br/>        offset             = optional(string)<br/>        width              = optional(number)<br/>      }))<br/>    }))<br/>    description      = optional(string)<br/>    filter           = string<br/>    label_extractors = optional(map(string))<br/>    metric_descriptor = optional(object({<br/>      description  = optional(string) # Not supported<br/>      display_name = optional(string)<br/>      labels = optional(list(object({<br/>        description = optional(string)<br/>        key         = string<br/>        value_type  = optional(string)<br/>      })))<br/>      metric_kind = string           # validate<br/>      type        = string           # Not supported<br/>      unit        = optional(string) # validate<br/>      value_type  = string           # validate<br/>    }))<br/>    value_extractor = optional(string)<br/>  }))</pre> | <pre>[<br/>  {<br/>    "filter": "",<br/>    "name": ""<br/>  }<br/>]</pre> | no |
| <a name="input_metric_descriptors"></a> [metric\_descriptors](#input\_metric\_descriptors) | List of Metric Dedscriptor configuration objects | <pre>list(object({<br/>    description  = string<br/>    display_name = string<br/>    labels = optional(object({<br/>      description = optional(string)<br/>      key         = string<br/>      value_type  = optional(string) # validate<br/>    }))<br/>    launch_stage = optional(string) # validate<br/>    metadata = optional(object({<br/>      ingest_delay  = optional(string)<br/>      sample_period = optional(string)<br/>    }))<br/>    metric_kind = string # validate<br/>    type        = string<br/>    unit        = optional(string)<br/>    value_type  = string # validate<br/>  }))</pre> | <pre>[<br/>  {<br/>    "description": "",<br/>    "display_name": "",<br/>    "metric_kind": "",<br/>    "type": "",<br/>    "value_type": ""<br/>  }<br/>]</pre> | no |
| <a name="input_notification_channels"></a> [notification\_channels](#input\_notification\_channels) | Notification channel configuration objects | <pre>list(object({<br/>    description  = string<br/>    display_name = string<br/>    enabled      = bool<br/>    labels       = optional(map(string))<br/>    sensitive_labels = optional(object({<br/>      auth_token  = optional(string)<br/>      password    = optional(string)<br/>      service_key = optional(string)<br/>    }))<br/>    user_labels = optional(map(string))<br/>    type        = string<br/>  }))</pre> | <pre>[<br/>  {<br/>    "description": "",<br/>    "display_name": "",<br/>    "enabled": false,<br/>    "type": "sms"<br/>  }<br/>]</pre> | no |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | Organization name | `string` | `""` | no |
| <a name="input_organization_sink"></a> [organization\_sink](#input\_organization\_sink) | Organization Sink name | `string` | `""` | no |
| <a name="input_services"></a> [services](#input\_services) | List of Service configuration objects | <pre>list(object({<br/>    basic_service = optional(object({<br/>      service_labels = optional(map(string))<br/>      service_type   = optional(string) # validate<br/>    }))<br/>    display_name = string<br/>    service_id   = string<br/>    user_labels  = optional(map(string))<br/>  }))</pre> | <pre>[<br/>  {<br/>    "display_name": "",<br/>    "service_id": ""<br/>  }<br/>]</pre> | no |
| <a name="input_slos"></a> [slos](#input\_slos) | List of SLO configuration objects | <pre>list(object({<br/>    basic_sli = optional(object({<br/>      availability = optional(object({<br/>        enabled = optional(bool)<br/>      }))<br/>      latency = optional(object({<br/>        threshold = string<br/>      }))<br/>      location = optional(string)<br/>      method   = optional(string)<br/>      version  = optional(string)<br/>    }))                                # validate<br/>    calendar_period = optional(string) # validate<br/>    display_name    = string<br/>    goal            = string<br/>    request_based_sli = optional(object({<br/>      distribution_cut = optional(object({<br/>        distribution_filter = string<br/>        range = object({<br/>          max = optional(string)<br/>          min = optional(string)<br/>        })<br/>      }))<br/>      good_total_ratio = optional(object({<br/>        bad_service_filter   = optional(string)<br/>        good_service_filter  = optional(string) #map(string) ?<br/>        total_service_filter = optional(string)<br/>      }))<br/>    })) # validate<br/>    rolling_period_days = optional(string)<br/>    service             = string<br/>    slo_id              = optional(string)<br/>    user_labels         = optional(map(string))<br/>    windows_based_sli = optional(object({<br/>      good_bad_metric_filter = optional(string)<br/>      good_total_ratio_threshold = optional(object({<br/>        basic_sli_performance = optional(object({<br/>          availability = optional(object({<br/>            enabled = optional(bool)<br/>          }))<br/>          latency = optional(object({<br/>            threshold = string<br/>          }))<br/>          location = optional(string)<br/>          method   = optional(string)<br/>          version  = optional(string)<br/>        }))<br/>        performance = optional(object({<br/>          distribution_cut = optional(object({<br/>            distribution_filter = string<br/>            range = object({<br/>              max = optional(string)<br/>              min = optional(string)<br/>            })<br/>          }))<br/>          good_total_ratio = optional(object({<br/>            bad_service_filter   = optional(string)<br/>            good_service_filter  = optional(string)<br/>            total_service_filter = optional(string)<br/>          }))<br/>        }))<br/>        threshold = optional(string)<br/>      }))<br/>      metric_mean_in_range = optional(object({<br/>        range = object({<br/>          max = optional(string)<br/>          min = optional(string)<br/>        })<br/>        time_series = string<br/>      }))<br/>      metric_sum_in_range = optional(object({<br/>        range = object({<br/>          max = optional(string)<br/>          min = optional(string)<br/>        })<br/>        time_series = string<br/>      }))<br/>      window_period = optional(string)<br/>    })) # validate<br/>  }))</pre> | <pre>[<br/>  {<br/>    "display_name": "",<br/>    "goal": "",<br/>    "service": ""<br/>  }<br/>]</pre> | no |
| <a name="input_uptime_checks"></a> [uptime\_checks](#input\_uptime\_checks) | Uptime check configuration objects | <pre>list(object({<br/>    checker_type = optional(string)<br/>    content_matchers = optional(object({<br/>      content = string<br/>      matcher = optional(string)<br/>      json_path_matcher = optional(object({<br/>        json_path    = string<br/>        json_matcher = optional(string)<br/>      }))<br/>    }))<br/>    display_name = string<br/>    http_check = optional(object({<br/>      accepted_response_status_codes = optional(list(object({<br/>        status_class = optional(string)<br/>        status_value = optional(string) # validate<br/>      })))<br/>      auth_info = optional(object({<br/>        password = string<br/>        username = string<br/>      }))<br/>      body           = optional(string)<br/>      content_type   = optional(string)<br/>      headers        = optional(map(string))<br/>      mark_headers   = optional(bool)<br/>      path           = optional(string)<br/>      port           = optional(string)<br/>      request_method = optional(string)<br/>      use_ssl        = optional(bool)<br/>      validate_ssl   = optional(bool)<br/>    }))<br/>    monitored_resource = optional(object({ # validate<br/>      labels = object({<br/>        cluster_name   = optional(string)<br/>        host           = optional(string)<br/>        instance_id    = optional(string)<br/>        location       = optional(string)<br/>        namespace_name = optional(string)<br/>        project_id     = optional(string)<br/>        service_name   = optional(string)<br/>        zone           = optional(string)<br/>      })<br/>      type = string<br/>    }))<br/>    period = optional(string) # validate<br/>    resource_group = optional(object({<br/>      group_id      = optional(string)<br/>      resource_type = optional(string) # validate<br/>    }))<br/>    # Requires 3. Either global (default) or 3 US regions<br/>    selected_regions = optional(list(string)) # validate<br/>    tcp_check = optional(object({<br/>      port = string<br/>    }))<br/>    timeout            = string # validate<br/>    log_check_failures = optional(bool)<br/>  }))</pre> | <pre>[<br/>  {<br/>    "display_name": "",<br/>    "monitored_resource": {<br/>      "labels": {<br/>        "project_id": ""<br/>      },<br/>      "type": "uptime_url"<br/>    },<br/>    "timeout": "10s"<br/>  }<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alert_policy_channel_names"></a> [alert\_policy\_channel\_names](#output\_alert\_policy\_channel\_names) | Notification channels referenced by alert policies |
| <a name="output_custom_service_ids"></a> [custom\_service\_ids](#output\_custom\_service\_ids) | List of custom service IDs |
| <a name="output_custom_service_telemetry"></a> [custom\_service\_telemetry](#output\_custom\_service\_telemetry) | List of custom service telemetry |
| <a name="output_dashboards"></a> [dashboards](#output\_dashboards) | List of dashboard objects |
| <a name="output_groups_parents"></a> [groups\_parents](#output\_groups\_parents) | Root parent groups |
| <a name="output_groups_r_subgroups1"></a> [groups\_r\_subgroups1](#output\_groups\_r\_subgroups1) | Resource: subgroups level 1 |
| <a name="output_groups_r_subgroups2"></a> [groups\_r\_subgroups2](#output\_groups\_r\_subgroups2) | Resource: subgroups level 2 |
| <a name="output_groups_subgroups1"></a> [groups\_subgroups1](#output\_groups\_subgroups1) | Subgroups - level 1 |
| <a name="output_groups_subgroups2"></a> [groups\_subgroups2](#output\_groups\_subgroups2) | Subgroups - level 2 |
| <a name="output_logging_bucket_config"></a> [logging\_bucket\_config](#output\_logging\_bucket\_config) | Full config of the logging bucket config |
| <a name="output_logging_metrics"></a> [logging\_metrics](#output\_logging\_metrics) | All logging metric objects - for debugging |
| <a name="output_metric_descriptor_monitored_resource_types"></a> [metric\_descriptor\_monitored\_resource\_types](#output\_metric\_descriptor\_monitored\_resource\_types) | List of metric descriptor monitored resource types |
| <a name="output_metric_descriptor_names"></a> [metric\_descriptor\_names](#output\_metric\_descriptor\_names) | List of metric descriptor names |
| <a name="output_metric_scope_projects"></a> [metric\_scope\_projects](#output\_metric\_scope\_projects) | GCP project settings before any changes |
| <a name="output_metrics_scope_monitored_projects"></a> [metrics\_scope\_monitored\_projects](#output\_metrics\_scope\_monitored\_projects) | Monitored projects - Full data for debugging |
| <a name="output_metrics_scope_project"></a> [metrics\_scope\_project](#output\_metrics\_scope\_project) | Metrics scope project ID |
| <a name="output_notification_channel_pagerduty_integrations"></a> [notification\_channel\_pagerduty\_integrations](#output\_notification\_channel\_pagerduty\_integrations) | Pagerduty integrations |
| <a name="output_notification_channel_pagerduty_refs"></a> [notification\_channel\_pagerduty\_refs](#output\_notification\_channel\_pagerduty\_refs) | List of pagerduty service key references |
| <a name="output_notification_channel_secret_refs"></a> [notification\_channel\_secret\_refs](#output\_notification\_channel\_secret\_refs) | List of Google secret manager secret references |
| <a name="output_service_ids"></a> [service\_ids](#output\_service\_ids) | List of service IDs |
| <a name="output_service_telemetry"></a> [service\_telemetry](#output\_service\_telemetry) | List of service telemetry |
| <a name="output_slo_ids"></a> [slo\_ids](#output\_slo\_ids) | List of SLO IDs |
| <a name="output_uptime_check_ids"></a> [uptime\_check\_ids](#output\_uptime\_check\_ids) | The IDs of the uptime checks. |
| <a name="output_uptime_checks"></a> [uptime\_checks](#output\_uptime\_checks) | All uptime checks managed |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
