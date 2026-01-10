# Google Cloud Monitoring - SLOs

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.5 |
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
| [google_monitoring_slo.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_slo) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | GCP project to put monitoring in | `string` | n/a | yes |
| <a name="input_slos"></a> [slos](#input\_slos) | List of SLO configuration objects | <pre>list(object({<br/>    basic_sli = optional(object({<br/>      availability = optional(object({<br/>        enabled = optional(bool)<br/>      }))<br/>      latency = optional(object({<br/>        threshold = string<br/>      }))<br/>      location = optional(string)<br/>      method   = optional(string)<br/>      version  = optional(string)<br/>    }))                                # validate<br/>    calendar_period = optional(string) # validate<br/>    display_name    = string<br/>    goal            = string<br/>    request_based_sli = optional(object({<br/>      distribution_cut = optional(object({<br/>        distribution_filter = string<br/>        range = object({<br/>          max = optional(string)<br/>          min = optional(string)<br/>        })<br/>      }))<br/>      good_total_ratio = optional(object({<br/>        bad_service_filter   = optional(string)<br/>        good_service_filter  = optional(string) #map(string) ?<br/>        total_service_filter = optional(string)<br/>      }))<br/>    })) # validate<br/>    rolling_period_days = optional(string)<br/>    service             = string<br/>    slo_id              = optional(string)<br/>    user_labels         = optional(map(string))<br/>    windows_based_sli = optional(object({<br/>      good_bad_metric_filter = optional(string)<br/>      good_total_ratio_threshold = optional(object({<br/>        basic_sli_performance = optional(object({<br/>          availability = optional(object({<br/>            enabled = optional(bool)<br/>          }))<br/>          latency = optional(object({<br/>            threshold = string<br/>          }))<br/>          location = optional(string)<br/>          method   = optional(string)<br/>          version  = optional(string)<br/>        }))<br/>        performance = optional(object({<br/>          distribution_cut = optional(object({<br/>            distribution_filter = string<br/>            range = object({<br/>              max = optional(string)<br/>              min = optional(string)<br/>            })<br/>          }))<br/>          good_total_ratio = optional(object({<br/>            bad_service_filter   = optional(string)<br/>            good_service_filter  = optional(string)<br/>            total_service_filter = optional(string)<br/>          }))<br/>        }))<br/>        threshold = optional(string)<br/>      }))<br/>      metric_mean_in_range = optional(object({<br/>        range = object({<br/>          max = optional(string)<br/>          min = optional(string)<br/>        })<br/>        time_series = string<br/>      }))<br/>      metric_sum_in_range = optional(object({<br/>        range = object({<br/>          max = optional(string)<br/>          min = optional(string)<br/>        })<br/>        time_series = string<br/>      }))<br/>      window_period = optional(string)<br/>    })) # validate<br/>  }))</pre> | <pre>[<br/>  {<br/>    "display_name": "",<br/>    "goal": "",<br/>    "service": ""<br/>  }<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | List of SLO IDs |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
