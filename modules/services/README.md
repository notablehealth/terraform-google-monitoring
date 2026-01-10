# Google Cloud Monitoring - Services

- Terraform currently doesn't support
  - cloudRun
  - gkeNamespace
  - gkeWorkload
  - gkeService
  - istio services

## API

- https://cloud.google.com/monitoring/api/ref_v3/rest/v3/services

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
| [google_monitoring_custom_service.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_custom_service) | resource |
| [google_monitoring_service.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_services"></a> [custom\_services](#input\_custom\_services) | List of Custom Service configuration objects | <pre>list(object({<br/>    display_name = optional(string)<br/>    service_id   = optional(string)<br/>    telemetry = optional(object({<br/>      resource_name = optional(string)<br/>    }))<br/>    user_labels = optional(map(string))<br/>  }))</pre> | `[]` | no |
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | GCP project to put monitoring in | `string` | n/a | yes |
| <a name="input_services"></a> [services](#input\_services) | List of Service configuration objects | <pre>list(object({<br/>    basic_service = optional(object({<br/>      service_labels = optional(map(string))<br/>      service_type   = optional(string) # validate<br/>    }))<br/>    display_name = string<br/>    service_id   = string<br/>    user_labels  = optional(map(string))<br/>  }))</pre> | <pre>[<br/>  {<br/>    "display_name": "",<br/>    "service_id": ""<br/>  }<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_custom_service_ids"></a> [custom\_service\_ids](#output\_custom\_service\_ids) | List of custom service IDs |
| <a name="output_custom_service_telemetry"></a> [custom\_service\_telemetry](#output\_custom\_service\_telemetry) | List of custom service telemetry |
| <a name="output_service_ids"></a> [service\_ids](#output\_service\_ids) | List of service IDs |
| <a name="output_service_telemetry"></a> [service\_telemetry](#output\_service\_telemetry) | List of service telemetry |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
