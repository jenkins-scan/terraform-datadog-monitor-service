resource "datadog_monitor" "service_monitor" {
  count              = length(local.metrics)
  name               = "[${var.tags["stack"]}-${var.tags["layer"]}-${var.tags["env"]}] Service:${var.service_name}   Metric:${local.metrics[count.index].name}   Environment:${var.tags["env"]}"
  type               = "query alert"
  message            = local.metrics[count.index].message
  escalation_message = local.metrics[count.index].escalation_message
  locked             = var.locked

  query = local.metrics[count.index].query

  thresholds = local.metrics[count.index].thresholds

  notify_audit      = var.notify_audit
  timeout_h         = var.timeout_h
  no_data_timeframe = var.notify_no_data ? local.metrics[count.index].no_data_timeframe : 0
  notify_no_data    = var.notify_no_data
  renotify_interval = var.renotify_interval

  include_tags        = true
  tags                = sort(concat(local.tags_list, list("service:${var.service_name}", "metric_name:${local.metrics[count.index].name}")))
  require_full_window = false

  lifecycle {
    ignore_changes = ["silenced"]
  }
}
