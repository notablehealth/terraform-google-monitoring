# Manage GCP monitoring notification channels

## Pagerduty authentication

- Environment variable must be set to lookup integration keys
  - PAGERDUTY_TOKEN
- If not using pagerduty, create this provider to disable initial API call and ensure that there are no label values that start with pagerduty

```hcl
provider "pagerduty" {
  token                       = "SKIP"
  skip_credentials_validation = true
}
```

## Sensitive Labels lookups

This module can lookup integration keys from Pagerduty and secrets from Google secret manager for labels in sensitive_labels.

Pagerduty integration keys can be looked up for the *service_key* label by using the format *pagerduty:service_name:integration_summary*

Secret can be looked up in any of the sensitive_label labels by using the format *secret:secret_name*

## Slack App (bot OAuth token) required scopes

- chat:write
- chat:write.customize
- chat:write.public

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.5 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 6.9 |
| <a name="requirement_pagerduty"></a> [pagerduty](#requirement\_pagerduty) | ~> 3.13 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 6.50.0 |
| <a name="provider_pagerduty"></a> [pagerduty](#provider\_pagerduty) | 3.30.8 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_monitoring_notification_channel.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_notification_channel) | resource |
| [google_secret_manager_secret_version_access.notification_channels](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/secret_manager_secret_version_access) | data source |
| [pagerduty_service_integration.notification_channels](https://registry.terraform.io/providers/pagerduty/pagerduty/latest/docs/data-sources/service_integration) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | GCP project to put monitoring in | `string` | n/a | yes |
| <a name="input_notification_channels"></a> [notification\_channels](#input\_notification\_channels) | Notification channel configuration objects | <pre>list(object({<br/>    description  = string<br/>    display_name = string<br/>    enabled      = bool<br/>    labels       = optional(map(string))<br/>    sensitive_labels = optional(object({<br/>      auth_token  = optional(string)<br/>      password    = optional(string)<br/>      service_key = optional(string)<br/>    }))<br/>    user_labels = optional(map(string))<br/>    type        = string<br/>  }))</pre> | <pre>[<br/>  {<br/>    "description": "",<br/>    "display_name": "",<br/>    "enabled": false,<br/>    "type": "sms"<br/>  }<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_channel_pagerduty_refs"></a> [channel\_pagerduty\_refs](#output\_channel\_pagerduty\_refs) | List of pagerduty service key references |
| <a name="output_channel_secret_refs"></a> [channel\_secret\_refs](#output\_channel\_secret\_refs) | List of Google secret manager secret references |
| <a name="output_pagerduty_integrations"></a> [pagerduty\_integrations](#output\_pagerduty\_integrations) | Pagerduty integrations |
| <a name="output_secrets"></a> [secrets](#output\_secrets) | Secrets |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
