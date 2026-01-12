
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
# data-access-audit-logs

This module can be used to manage data access audit log configuration for a
project, folder, or organization.

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
| [google_folder_iam_audit_config.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/folder_iam_audit_config) | resource |
| [google_organization_iam_audit_config.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_audit_config) | resource |
| [google_project_iam_audit_config.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_audit_config) | resource |
| [google_folder.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/folder) | data source |
| [google_organization.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/organization) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_audit_configs"></a> [audit\_configs](#input\_audit\_configs) | List of data audit configuration objects for IAM policy. | <pre>list(object({<br/>    service = string<br/>    audit_log_configs = list(object({<br/>      log_type         = string<br/>      exempted_members = optional(list(string))<br/>    }))<br/>  }))</pre> | `[]` | no |
| <a name="input_target_id"></a> [target\_id](#input\_target\_id) | The id of the resource to manage data access audit logs for. | `string` | n/a | yes |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | The type of the resource to manage data access audit logs for (folder, organization, project). | `string` | `"project"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_folder_display_name"></a> [folder\_display\_name](#output\_folder\_display\_name) | Folder Display Name |
| <a name="output_folder_id"></a> [folder\_id](#output\_folder\_id) | Folder ID |
| <a name="output_organization_id"></a> [organization\_id](#output\_organization\_id) | Organization ID |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
