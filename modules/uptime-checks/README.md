# Manage GCP monitoring uptime checks

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
| [google_monitoring_uptime_check_config.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_uptime_check_config) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | GCP project to put monitoring in | `string` | n/a | yes |
| <a name="input_uptime_checks"></a> [uptime\_checks](#input\_uptime\_checks) | Uptime check configuration objects | <pre>list(object({<br/>    checker_type = optional(string)<br/>    content_matchers = optional(object({<br/>      content = string<br/>      matcher = optional(string)<br/>      json_path_matcher = optional(object({<br/>        json_path    = string<br/>        json_matcher = optional(string)<br/>      }))<br/>    }))<br/>    display_name = string<br/>    http_check = optional(object({<br/>      accepted_response_status_codes = optional(list(object({<br/>        status_class = optional(string)<br/>        status_value = optional(string) # validate<br/>      })))<br/>      auth_info = optional(object({<br/>        password = string<br/>        username = string<br/>      }))<br/>      body           = optional(string)<br/>      content_type   = optional(string)<br/>      headers        = optional(map(string))<br/>      mark_headers   = optional(bool)<br/>      path           = optional(string)<br/>      port           = optional(string)<br/>      request_method = optional(string)<br/>      use_ssl        = optional(bool)<br/>      validate_ssl   = optional(bool)<br/>    }))<br/>    monitored_resource = optional(object({ # validate<br/>      labels = object({<br/>        cluster_name   = optional(string)<br/>        host           = optional(string)<br/>        instance_id    = optional(string)<br/>        location       = optional(string)<br/>        namespace_name = optional(string)<br/>        project_id     = optional(string)<br/>        service_name   = optional(string)<br/>        zone           = optional(string)<br/>      })<br/>      type = string<br/>    }))<br/>    period = optional(string) # validate<br/>    resource_group = optional(object({<br/>      group_id      = optional(string)<br/>      resource_type = optional(string) # validate<br/>    }))<br/>    # Requires 3. Either global (default) or 3 US regions<br/>    selected_regions = optional(list(string)) # validate<br/>    tcp_check = optional(object({<br/>      port = string<br/>    }))<br/>    timeout            = string # validate<br/>    log_check_failures = optional(bool)<br/>  }))</pre> | <pre>[<br/>  {<br/>    "display_name": "",<br/>    "monitored_resource": {<br/>      "labels": {<br/>        "project_id": ""<br/>      },<br/>      "type": "uptime_url"<br/>    },<br/>    "timeout": "10s"<br/>  }<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | The IDs of the uptime checks. |
| <a name="output_uptime_checks"></a> [uptime\_checks](#output\_uptime\_checks) | All uptime checks managed |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
