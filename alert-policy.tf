resource "google_monitoring_alert_policy" "alert_policy" {
  project               =  var.main.project
  display_name          = "My Alert Policy"
  notification_channels = [google_monitoring_notification_channel.basic.name]
  combiner              = "OR"
  conditions {
    display_name = "GKE container in cluster has high CPU limit utilization"
    condition_threshold {
      filter   = "resource.type = \"k8s_container\" AND metric.type = \"kubernetes.io/container/cpu/limit_utilization\" AND resource.labels.cluster_name=\"cluster-1\""
      duration = "60s"
      comparison = "COMPARISON_GT"
      aggregations {
        alignment_period   = "60s"
        per_series_aligner = "ALIGN_MEAN"
        cross_series_reducer = "REDUCE_NONE"
      }
    }
  }

  documentation {
    content = "GKE container in cluster has high CPU limit utilization"
  }

  user_labels = {
    app="test"
  }
  
  alert_strategy {
    auto_close  = "1800s"
  }

  depends_on = [
    google_monitoring_notification_channel.basic
  ]
}


