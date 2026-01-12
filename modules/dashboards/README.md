# Manage GCP monitoring dashboards

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
| [google_monitoring_dashboard.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_dashboard) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dashboard_sources_path"></a> [dashboard\_sources\_path](#input\_dashboard\_sources\_path) | Path to process dashboard source files. Example: ${path.module}/dashboards | `string` | n/a | yes |
| <a name="input_dashboard_sources_pattern"></a> [dashboard\_sources\_pattern](#input\_dashboard\_sources\_pattern) | Dashboard json files pattern | `string` | `"**"` | no |
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | GCP project to put monitoring in | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dashboards"></a> [dashboards](#output\_dashboards) | List of dashboard objects |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
