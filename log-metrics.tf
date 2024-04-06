resource "google_logging_metric" "iam_role" {
  project = var.main.project
  name    = "iam_role_change"
  filter  = "resource.type=\"iam_role\" AND protoPayload.methodName = \"google.iam.admin.v1.CreateRole\" OR protoPayload.methodName=\"google.iam.admin.v1.DeleteRole\" OR protoPayload.methodName=\"google.iam.admin.v1.UpdateRole\""
  metric_descriptor {
    metric_kind = "DELTA"
    value_type  = "INT64"
    labels {
      key        = "operation"
      value_type = "STRING"
    }
    labels {
      key        = "role"
      value_type = "STRING"
    }

  }
  label_extractors = {
    "operation" = "EXTRACT(protoPayload.methodName)"
    "role"      = "EXTRACT(protoPayload.resourceName)"
  }
}
