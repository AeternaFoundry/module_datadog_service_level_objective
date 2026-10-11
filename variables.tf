variable "service_level_objectives" {
  description = <<EOT
Map of service_level_objectives, attributes below
Required:
    - name
    - type
    - thresholds (block):
        - target (required)
        - timeframe (required)
        - warning (optional)
Optional:
    - description
    - force_delete
    - groups
    - ignore_tag_keys
    - monitor_ids
    - tags
    - target_threshold
    - timeframe
    - validate
    - warning_threshold
    - query (block):
        - denominator (required)
        - numerator (required)
    - sli_specification (block):
        - count (optional, block):
            - bad_events_formula (optional)
            - good_events_formula (required)
            - queries (required, block):
                - metric_query (optional, block):
                    - data_source (optional)
                    - name (required)
                    - query (required)
            - total_events_formula (optional)
        - time_slice (optional, block):
            - comparator (required)
            - query (required, block):
                - formula (required, block):
                    - formula_expression (required)
                - query (required, block):
                    - metric_query (optional, block):
                        - data_source (optional)
                        - name (required)
                        - query (required)
            - query_interval_seconds (optional)
            - threshold (required)
EOT

  type = map(object({
    name              = string
    type              = string
    description       = optional(string)
    force_delete      = optional(bool)
    groups            = optional(set(string))
    ignore_tag_keys   = optional(set(string))
    monitor_ids       = optional(set(number))
    tags              = optional(set(string))
    target_threshold  = optional(number)
    timeframe         = optional(string)
    validate          = optional(bool)
    warning_threshold = optional(number)
    thresholds = list(object({
      target    = number
      timeframe = string
      warning   = optional(number)
    }))
    query = optional(object({
      denominator = string
      numerator   = string
    }))
    sli_specification = optional(object({
      count = optional(object({
        bad_events_formula  = optional(string)
        good_events_formula = string
        queries = list(object({
          metric_query = optional(object({
            data_source = optional(string)
            name        = string
            query       = string
          }))
        }))
        total_events_formula = optional(string)
      }))
      time_slice = optional(object({
        comparator = string
        query = object({
          formula = object({
            formula_expression = string
          })
          query = list(object({
            metric_query = optional(object({
              data_source = optional(string)
              name        = string
              query       = string
            }))
          }))
        })
        query_interval_seconds = optional(number)
        threshold              = number
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.service_level_objectives : (
        length(v.thresholds) >= 1
      )
    ])
    error_message = "Each thresholds list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.service_level_objectives : (
        v.sli_specification == null || (v.sli_specification.count == null || (length(v.sli_specification.count.queries) >= 1))
      )
    ])
    error_message = "Each queries list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.service_level_objectives : (
        v.sli_specification == null || (v.sli_specification.time_slice == null || (length(v.sli_specification.time_slice.query.query) >= 1))
      )
    ])
    error_message = "Each query list must contain at least 1 items"
  }
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

