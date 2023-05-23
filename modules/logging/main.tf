
### Logging Bucket
resource "google_logging_project_bucket_config" "self" {
  bucket_id        = var.logging_bucket
  description      = var.logging_bucket_description
  enable_analytics = true
  location         = "global"
  project          = var.logging_project
  retention_days   = var.logging_bucket_retention_days
}
resource "google_logging_linked_dataset" "self" {
  count       = var.enable_linked_dataset ? 1 : 0
  bucket      = google_logging_project_bucket_config.self.id
  description = var.linked_dataset_description
  link_id     = var.logging_dataset_link_id
  location    = "global"
  #parent =
}

### Organization Sink
resource "google_logging_organization_sink" "self" {
  description      = var.organization_sink_description
  disabled         = var.disable_organization_sink
  include_children = true
  name             = var.organization_sink
  org_id           = data.google_organization.self.org_id
  # Can export to pubsub, cloud storage, or bigquery
  #destination = "storage.googleapis.com/${google_storage_bucket.log-bucket.name}"
  destination = google_logging_project_bucket_config.self.id

  # https://cloud.google.com/logging/docs/view/building-queries
  # https://cloud.google.com/logging/docs/view/logging-query-language
  # https://cloud.google.com/logging/docs/view/query-library

  # Log all WARN or higher severity messages relating to instances
  filter = "resource.type = gce_instance AND severity >= WARNING"
  # Support multiple exclusion blocks (list(object({})))
  #   name
  #   description
  #   filter
  #   disabled = optional(bool, false)
  #dynamic "exclusions" {
  #  for_each = var.organization_sink_exclude_folders
  #  content {
  #    name        = "exclude-source-${exclusions.value}"
  #    description = "Exclusion for folder ${exclusions.value}"
  #    #filter      = "resource.type = folder AND resource.labels.folder_id = ${exclusions.value}"
  #    filter      = "source(folders/${exclusions.value})"
  #    #disabled =
  #  }
  #}
  # folder: system-gsuite ID#
  #source(folders/FOLDER_ID)
  #source(projects/PROJECT_ID)
}

### Permissions
# sink Service Account needs Logs Buckets Writer to log bucket

# Allow each sink's service account to write logs into the audit logs project
resource "google_project_iam_member" "self" {
  project = var.logging_project
  role    = "roles/logging.bucketWriter"
  member  = google_logging_organization_sink.self.writer_identity
}
