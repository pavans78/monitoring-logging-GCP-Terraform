resource "google_monitoring_uptime_check_config" "http" {
  display_name = "HTTP Uptime Check"
  timeout      = "10s"
  period       = "60s"

  http_check {
    path = "/"
    port = "80"
  }

  monitored_resource {
    type = "uptime_url"
    labels = {
      project_id = var.main.project
      host       = "http://example-app/web"
    }
  }
}

