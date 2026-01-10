
terraform {
  required_version = ">= 1.4.5"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.9"
    }
  }
}
