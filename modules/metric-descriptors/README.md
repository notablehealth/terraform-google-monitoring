# Manage Metric Descriptors

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
| [google_monitoring_metric_descriptor.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_metric_descriptor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | GCP project to put monitoring in | `string` | n/a | yes |
| <a name="input_metric_descriptors"></a> [metric\_descriptors](#input\_metric\_descriptors) | List of Metric Dedscriptor configuration objects | <pre>list(object({<br/>    description  = string<br/>    display_name = string<br/>    labels = optional(object({<br/>      description = optional(string)<br/>      key         = string<br/>      value_type  = optional(string) # validate<br/>    }))<br/>    launch_stage = optional(string) # validate<br/>    metadata = optional(object({<br/>      ingest_delay  = optional(string)<br/>      sample_period = optional(string)<br/>    }))<br/>    metric_kind = string # validate<br/>    type        = string<br/>    unit        = optional(string)<br/>    value_type  = string # validate<br/>  }))</pre> | <pre>[<br/>  {<br/>    "description": "",<br/>    "display_name": "",<br/>    "metric_kind": "",<br/>    "type": "",<br/>    "value_type": ""<br/>  }<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_monitored_resource_types"></a> [monitored\_resource\_types](#output\_monitored\_resource\_types) | List of metric descriptor monitored resource types |
| <a name="output_names"></a> [names](#output\_names) | List of metric descriptor names |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
