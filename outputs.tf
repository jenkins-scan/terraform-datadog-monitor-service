output "monitor_id" {
  description = "The Identifiers of Service DataDog Monitors"
  value       = "${datadog_monitor.service_monitor.*.id}"
}
