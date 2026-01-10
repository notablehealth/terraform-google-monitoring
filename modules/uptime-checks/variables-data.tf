
#https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_uptime_check_config
variable "uptime_checks" {
  description = "Uptime check configuration objects"
  type = list(object({
    checker_type = optional(string)
    content_matchers = optional(object({
      content = string
      matcher = optional(string)
      json_path_matcher = optional(object({
        json_path    = string
        json_matcher = optional(string)
      }))
    }))
    display_name = string
    http_check = optional(object({
      accepted_response_status_codes = optional(list(object({
        status_class = optional(string)
        status_value = optional(string) # validate
      })))
      auth_info = optional(object({
        password = string
        username = string
      }))
      body           = optional(string)
      content_type   = optional(string)
      headers        = optional(map(string))
      mark_headers   = optional(bool)
      path           = optional(string)
      port           = optional(string)
      request_method = optional(string)
      use_ssl        = optional(bool)
      validate_ssl   = optional(bool)
    }))
    monitored_resource = optional(object({ # validate
      labels = object({
        cluster_name   = optional(string)
        host           = optional(string)
        instance_id    = optional(string)
        location       = optional(string)
        namespace_name = optional(string)
        project_id     = optional(string)
        service_name   = optional(string)
        zone           = optional(string)
      })
      type = string
    }))
    period = optional(string) # validate
    resource_group = optional(object({
      group_id      = optional(string)
      resource_type = optional(string) # validate
    }))
    # Requires 3. Either global (default) or 3 US regions
    selected_regions = optional(list(string)) # validate
    tcp_check = optional(object({
      port = string
    }))
    timeout            = string # validate
    log_check_failures = optional(bool)
  }))

  # TODO: make these optional to match if monitored_resource is defined
  validation { # Valid monitored_resource types
    condition = alltrue(flatten([
      for check in var.uptime_checks :
      # 7 options
      contains(["gce_instance", "k8s_service", "servicedirectory_service", "uptime_url"],
    check.monitored_resource.type)]))
    error_message = "Allowed values for monitored_resource.type: gce_instance, k8s_service, servicedirectory_service, uptime_url."
  }
  validation { # Required labels per monitored_resource.type
    condition = alltrue([
      for check in var.uptime_checks :
      check.monitored_resource.type == "gce_instance" ?
      length(setintersection(toset(keys(check.monitored_resource.labels)), toset(["instance_id", "project_id", "zone"]))) == 3
      : true
    ])
    error_message = "Type gce_instance requires instance_id, project_id, zone."
  }
  validation { # Required labels per monitored_resource.type
    condition = alltrue([
      for check in var.uptime_checks :
      check.monitored_resource.type == "k8s_service" ?
      length(setintersection(toset(keys(check.monitored_resource.labels)), toset(["cluster_name", "location", "namespace_name", "project_id", "service_name"]))) == 5
      : true
    ])
    error_message = "Type k8s_service requires labels: cluster_name, location, namespace_name, project_id, service_name."
  }
  validation { # Required labels per monitored_resource.type
    condition = alltrue([
      for check in var.uptime_checks :
      check.monitored_resource.type == "servicedirectory_service" ?
      length(setintersection(toset(keys(check.monitored_resource.labels)), toset(["location", "namespace_name", "project_id", "service_name"]))) == 4
      : true
    ])
    error_message = "Type servicedirectory_service requires labels: location, namespace_name, project_id, service_name."
  }
  validation { # Required labels per monitored_resource.type
    condition = alltrue([
      for check in var.uptime_checks :
      check.monitored_resource.type == "uptime_url" ?
      length(setintersection(toset(keys(check.monitored_resource.labels)), toset(["host", "project_id"]))) == 2
      : true
    ])
    error_message = "Type uptime_url requires labels: host, project_id."
  }
  default = [{
    display_name = ""
    timeout      = "10s"
    monitored_resource = {
      labels = {
        project_id = ""
      }
      type = "uptime_url"
    }
  }]
}
