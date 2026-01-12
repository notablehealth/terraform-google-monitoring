# Monitoring groups

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
| [google_monitoring_group.parents](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_group) | resource |
| [google_monitoring_group.subgroups1](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_group) | resource |
| [google_monitoring_group.subgroups2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | GCP project ID | `string` | n/a | yes |
| <a name="input_groups"></a> [groups](#input\_groups) | List of group confiiguration object | <pre>list(object({<br/>    display_name = string<br/>    filter       = string<br/>    is_cluster   = optional(bool)<br/>    parent_name  = optional(string)<br/>  }))</pre> | <pre>[<br/>  {<br/>    "display_name": "",<br/>    "filter": ""<br/>  }<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_parents"></a> [parents](#output\_parents) | Root parent groups |
| <a name="output_r_subgroups1"></a> [r\_subgroups1](#output\_r\_subgroups1) | Resource: subgroups level 1 |
| <a name="output_r_subgroups2"></a> [r\_subgroups2](#output\_r\_subgroups2) | Resource: subgroups level 2 |
| <a name="output_subgroups1"></a> [subgroups1](#output\_subgroups1) | Subgroups - level 1 |
| <a name="output_subgroups2"></a> [subgroups2](#output\_subgroups2) | Subgroups - level 2 |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
