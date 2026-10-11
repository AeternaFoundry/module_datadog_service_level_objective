output "service_level_objectives_id" {
  description = "Map of id values across all service_level_objectives, keyed the same as var.service_level_objectives except keys with no id are omitted"
  value       = { for k, v in datadog_service_level_objective.service_level_objectives : k => v.id if v.id != null && length(v.id) > 0 }
}
output "service_level_objectives_description" {
  description = "Map of description values across all service_level_objectives, keyed the same as var.service_level_objectives except keys with no description are omitted"
  value       = { for k, v in datadog_service_level_objective.service_level_objectives : k => v.description if v.description != null && length(v.description) > 0 }
}
output "service_level_objectives_force_delete" {
  description = "Map of force_delete values across all service_level_objectives, keyed the same as var.service_level_objectives except keys with no force_delete are omitted"
  value       = { for k, v in datadog_service_level_objective.service_level_objectives : k => v.force_delete if v.force_delete != null }
}
output "service_level_objectives_groups" {
  description = "Map of groups values across all service_level_objectives, keyed the same as var.service_level_objectives except keys with no groups are omitted"
  value       = { for k, v in datadog_service_level_objective.service_level_objectives : k => v.groups if v.groups != null && length(v.groups) > 0 }
}
output "service_level_objectives_ignore_tag_keys" {
  description = "Map of ignore_tag_keys values across all service_level_objectives, keyed the same as var.service_level_objectives except keys with no ignore_tag_keys are omitted"
  value       = { for k, v in datadog_service_level_objective.service_level_objectives : k => v.ignore_tag_keys if v.ignore_tag_keys != null && length(v.ignore_tag_keys) > 0 }
}
output "service_level_objectives_monitor_ids" {
  description = "Map of monitor_ids values across all service_level_objectives, keyed the same as var.service_level_objectives except keys with no monitor_ids are omitted"
  value       = { for k, v in datadog_service_level_objective.service_level_objectives : k => v.monitor_ids if v.monitor_ids != null && length(v.monitor_ids) > 0 }
}
output "service_level_objectives_name" {
  description = "Map of name values across all service_level_objectives, keyed the same as var.service_level_objectives except keys with no name are omitted"
  value       = { for k, v in datadog_service_level_objective.service_level_objectives : k => v.name if v.name != null && length(v.name) > 0 }
}
output "service_level_objectives_query" {
  description = "Map of query values across all service_level_objectives, keyed the same as var.service_level_objectives except keys with no query are omitted"
  value       = { for k, v in datadog_service_level_objective.service_level_objectives : k => one(v.query) if v.query != null && length(v.query) > 0 }
}
output "service_level_objectives_sli_specification" {
  description = "Map of sli_specification values across all service_level_objectives, keyed the same as var.service_level_objectives except keys with no sli_specification are omitted"
  value       = { for k, v in datadog_service_level_objective.service_level_objectives : k => one(v.sli_specification) if v.sli_specification != null && length(v.sli_specification) > 0 }
}
output "service_level_objectives_tags" {
  description = "Map of tags values across all service_level_objectives, keyed the same as var.service_level_objectives except keys with no tags are omitted"
  value       = { for k, v in datadog_service_level_objective.service_level_objectives : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "service_level_objectives_target_threshold" {
  description = "Map of target_threshold values across all service_level_objectives, keyed the same as var.service_level_objectives except keys with no target_threshold are omitted"
  value       = { for k, v in datadog_service_level_objective.service_level_objectives : k => v.target_threshold if v.target_threshold != null }
}
output "service_level_objectives_thresholds" {
  description = "Map of thresholds values across all service_level_objectives, keyed the same as var.service_level_objectives except keys with no thresholds are omitted"
  value       = { for k, v in datadog_service_level_objective.service_level_objectives : k => v.thresholds if v.thresholds != null && length(v.thresholds) > 0 }
}
output "service_level_objectives_timeframe" {
  description = "Map of timeframe values across all service_level_objectives, keyed the same as var.service_level_objectives except keys with no timeframe are omitted"
  value       = { for k, v in datadog_service_level_objective.service_level_objectives : k => v.timeframe if v.timeframe != null && length(v.timeframe) > 0 }
}
output "service_level_objectives_type" {
  description = "Map of type values across all service_level_objectives, keyed the same as var.service_level_objectives except keys with no type are omitted"
  value       = { for k, v in datadog_service_level_objective.service_level_objectives : k => v.type if v.type != null && length(v.type) > 0 }
}
output "service_level_objectives_validate" {
  description = "Map of validate values across all service_level_objectives, keyed the same as var.service_level_objectives except keys with no validate are omitted"
  value       = { for k, v in datadog_service_level_objective.service_level_objectives : k => v.validate if v.validate != null }
}
output "service_level_objectives_warning_threshold" {
  description = "Map of warning_threshold values across all service_level_objectives, keyed the same as var.service_level_objectives except keys with no warning_threshold are omitted"
  value       = { for k, v in datadog_service_level_objective.service_level_objectives : k => v.warning_threshold if v.warning_threshold != null }
}

