# Manage custom logging metrics


https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_metric

Get existing custom metrics
>>>gcloud logging metrics list --format json

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
| [google_logging_metric.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_metric) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | GCP Project ID | `string` | n/a | yes |
| <a name="input_logging_metrics"></a> [logging\_metrics](#input\_logging\_metrics) | List of logging metric configuration objects | <pre>list(object({<br/>    name        = string<br/>    bucket_name = optional(string)<br/>    bucket_options = optional(object({<br/>      explicit_buckets = optional(object({<br/>        bounds = string<br/>      }))<br/>      exponential_buckets = optional(object({<br/>        growth_factor      = optional(number)<br/>        num_finite_buckets = optional(number)<br/>        scale              = optional(number)<br/>      }))<br/>      linear_buckets = optional(object({<br/>        num_finite_buckets = optional(number)<br/>        offset             = optional(string)<br/>        width              = optional(number)<br/>      }))<br/>    }))<br/>    description      = optional(string)<br/>    filter           = string<br/>    label_extractors = optional(map(string))<br/>    metric_descriptor = optional(object({<br/>      description  = optional(string) # Not supported<br/>      display_name = optional(string)<br/>      labels = optional(list(object({<br/>        description = optional(string)<br/>        key         = string<br/>        value_type  = optional(string)<br/>      })))<br/>      metric_kind = string           # validate<br/>      type        = string           # Not supported<br/>      unit        = optional(string) # validate<br/>      value_type  = string           # validate<br/>    }))<br/>    value_extractor = optional(string)<br/>  }))</pre> | <pre>[<br/>  {<br/>    "filter": "",<br/>    "name": ""<br/>  }<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_logging_metrics"></a> [logging\_metrics](#output\_logging\_metrics) | All logging metric objects - for debugging |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
