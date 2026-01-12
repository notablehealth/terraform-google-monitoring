# Organization Centralized Logging

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
| [google_logging_linked_dataset.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_linked_dataset) | resource |
| [google_logging_organization_sink.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_organization_sink) | resource |
| [google_logging_project_bucket_config.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_project_bucket_config) | resource |
| [google_project_iam_member.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_organization.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disable_organization_sink"></a> [disable\_organization\_sink](#input\_disable\_organization\_sink) | Disable organization sink | `bool` | `true` | no |
| <a name="input_enable_linked_dataset"></a> [enable\_linked\_dataset](#input\_enable\_linked\_dataset) | Enable linked dataset | `bool` | `false` | no |
| <a name="input_linked_dataset_description"></a> [linked\_dataset\_description](#input\_linked\_dataset\_description) | Linked dataset description | `string` | `""` | no |
| <a name="input_logging_bucket"></a> [logging\_bucket](#input\_logging\_bucket) | Logging bucket name | `string` | n/a | yes |
| <a name="input_logging_bucket_description"></a> [logging\_bucket\_description](#input\_logging\_bucket\_description) | Logging bucket description | `string` | `"Organization central logging bucket"` | no |
| <a name="input_logging_bucket_retention_days"></a> [logging\_bucket\_retention\_days](#input\_logging\_bucket\_retention\_days) | Logging bucket retention days | `number` | `30` | no |
| <a name="input_logging_dataset_link_id"></a> [logging\_dataset\_link\_id](#input\_logging\_dataset\_link\_id) | Logging dataset link ID | `string` | `""` | no |
| <a name="input_logging_project"></a> [logging\_project](#input\_logging\_project) | Ceneral logging project | `string` | n/a | yes |
| <a name="input_organization_name"></a> [organization\_name](#input\_organization\_name) | Organization name | `string` | n/a | yes |
| <a name="input_organization_sink"></a> [organization\_sink](#input\_organization\_sink) | Organization sink name | `string` | n/a | yes |
| <a name="input_organization_sink_description"></a> [organization\_sink\_description](#input\_organization\_sink\_description) | Organization sink description | `string` | `"Organization sink"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_logging_bucket_config"></a> [logging\_bucket\_config](#output\_logging\_bucket\_config) | Full config of the logging bucket config |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
