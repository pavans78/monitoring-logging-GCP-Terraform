resource "google_monitoring_dashboard" "dashboard" {
  dashboard_json = file("dashboards.json")
  project        = var.main.project
}

resource "google_monitoring_notification_channel" "basic" {
  project      = var.main.project
  display_name = "Test Notification Channel"
  type         = "email"
  labels = {
    email_address = "pavankumarsyave@gmail.com"
  }
  force_delete = false
}