
locals {
  domain_tags = ["domain:apm"]
  tags_list = concat([
    for key in keys(var.tags) :
    "${key}:${var.tags["${key}"]}"
    ],
  local.domain_tags)
  final_recipients_list = length(var.recipients_list) > 0 ? var.recipients_list : list("@slack-avaldigitallabs-mon-${var.tags["stack"]}-${var.tags["layer"]}")
  metrics = [
    {
      name               = "error_rate"
      enabled            = contains(keys(var.custom_metrics), "error_rate")
      no_data_timeframe  = 10
      query              = "sum(${var.custom_metrics["error_rate"]["period"]}): ( sum:trace.servlet.request.errors{service:${var.service_name},env:${var.tags["env"]}}.as_count()/sum:trace.servlet.request.hits{service:${var.service_name},env:pro}.as_count() ) > ${var.custom_metrics["error_rate"]["thresholds"][2]}"
      message            = "${templatefile("${path.module}/templates/message.tpl", { service_name = "${var.service_name}", stack = "${var.tags["stack"]}", layer = "${var.tags["layer"]}", metric_name = "error_rate", recipient_list = local.final_recipients_list })}"
      escalation_message = "${templatefile("${path.module}/templates/escalation_message.tpl", { service_name = "${var.service_name}", stack = "${var.tags["stack"]}", layer = "${var.tags["layer"]}", metric_name = "error_rate", recipient_list = local.final_recipients_list })}"
      thresholds = {
        warning           = var.custom_metrics["error_rate"]["thresholds"][0]
        warning_recovery  = var.custom_metrics["error_rate"]["thresholds"][1]
        critical          = var.custom_metrics["error_rate"]["thresholds"][2]
        critical_recovery = var.custom_metrics["error_rate"]["thresholds"][3]
      }
    },
    {
      name               = "average_latency"
      enabled            = contains(keys(var.custom_metrics), "average_latency")
      no_data_timeframe  = 10
      query              = "avg(${var.custom_metrics["average_latency"]["period"]}):( sum:trace.servlet.request.duration{service:${var.service_name},env:${var.tags["env"]}}.rollup(sum).fill(zero) / sum:trace.servlet.request.hits{service:${var.service_name},env:pro}.rollup(sum).fill(zero) ) > ${var.custom_metrics["average_latency"]["thresholds"][2]}"
      message            = "${templatefile("${path.module}/templates/message.tpl", { service_name = "${var.service_name}", stack = "${var.tags["stack"]}", layer = "${var.tags["layer"]}", metric_name = "average_latency", recipient_list = local.final_recipients_list })}"
      escalation_message = "${templatefile("${path.module}/templates/escalation_message.tpl", { service_name = "${var.service_name}", stack = "${var.tags["stack"]}", layer = "${var.tags["layer"]}", metric_name = "average_latency", recipient_list = local.final_recipients_list })}"
      thresholds = {
        warning           = var.custom_metrics["average_latency"]["thresholds"][0]
        warning_recovery  = var.custom_metrics["average_latency"]["thresholds"][1]
        critical          = var.custom_metrics["average_latency"]["thresholds"][2]
        critical_recovery = var.custom_metrics["average_latency"]["thresholds"][3]
      }
    }
  ]
}
