
terraform {
  required_version = ">= 1.4.5"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.62"
    }
    #google-beta = {
    #  source  = "hashicorp/google-beta"
    #  version = ">= 4.59.0"
    #}
    pagerduty = {
      source  = "pagerduty/pagerduty"
      version = "~> 3.1.1"
    }
  }
}
