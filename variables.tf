variable "service_name" {
  type        = "string"
  description = "The name of the service in DataDog APM"
}

variable "tags" {
  type        = map
  description = "A map of common tags to associate with monitor."
}

variable "new_variable" {
  type        = map
  description = "A map of common tags to associate with monitor."
}

variable "new_variable2" {
  type        = map
  description = "A map of common tags to associate with monitor."
}

variable "custom_metrics" {
  type        = map
  description = "A list of maps with custom metrics values."
  default     = {}
}

variable "recipients_list" {
  type        = list
  default     = []
  description = "The list of recipients to send monitor notification."
}

variable "locked" {
  type        = bool
  description = "A bool indicating whether changes to to this monitor should be restricted to the creator or admins."
  default     = false
}

variable "notify_audit" {
  type        = bool
  description = "A bool indicating whether tagged users will be notified on changes to this monitor. "
  default     = false
}

variable "timeout_h" {
  type        = number
  description = "The number of hours of the monitor not reporting data before it will automatically resolve from a triggered state."
  default     = 0
}

variable "notify_no_data" {
  type        = bool
  description = "A bool indicating whether this monitor will notify when data stops reporting. "
  default     = true
}

variable "renotify_interval" {
  type        = number
  description = "The number of minutes after the last notification before a monitor will re-notify on the current status. It will only re-notify if it's not resolved."
  default     = 10
}
