resource "datadog_service_level_objective" "service_level_objectives" {
  for_each = var.service_level_objectives

  name              = each.value.name
  type              = each.value.type
  description       = each.value.description
  force_delete      = each.value.force_delete
  groups            = each.value.groups
  ignore_tag_keys   = each.value.ignore_tag_keys
  monitor_ids       = each.value.monitor_ids
  tags              = each.value.tags
  target_threshold  = each.value.target_threshold
  timeframe         = each.value.timeframe
  validate          = each.value.validate
  warning_threshold = each.value.warning_threshold

  dynamic "thresholds" {
    for_each = each.value.thresholds
    content {
      target    = thresholds.value.target
      timeframe = thresholds.value.timeframe
      warning   = thresholds.value.warning
    }
  }

  dynamic "query" {
    for_each = each.value.query != null ? [each.value.query] : []
    content {
      denominator = query.value.denominator
      numerator   = query.value.numerator
    }
  }

  dynamic "sli_specification" {
    for_each = each.value.sli_specification != null ? [each.value.sli_specification] : []
    content {
      dynamic "count" {
        for_each = sli_specification.value.count != null ? [sli_specification.value.count] : []
        content {
          bad_events_formula  = count.value.bad_events_formula
          good_events_formula = count.value.good_events_formula
          dynamic "queries" {
            for_each = count.value.queries
            content {
              dynamic "metric_query" {
                for_each = queries.value.metric_query != null ? [queries.value.metric_query] : []
                content {
                  data_source = metric_query.value.data_source
                  name        = metric_query.value.name
                  query       = metric_query.value.query
                }
              }
            }
          }
          total_events_formula = count.value.total_events_formula
        }
      }
      dynamic "time_slice" {
        for_each = sli_specification.value.time_slice != null ? [sli_specification.value.time_slice] : []
        content {
          comparator = time_slice.value.comparator
          query {
            formula {
              formula_expression = time_slice.value.query.formula.formula_expression
            }
            dynamic "query" {
              for_each = time_slice.value.query.query
              content {
                dynamic "metric_query" {
                  for_each = query.value.metric_query != null ? [query.value.metric_query] : []
                  content {
                    data_source = metric_query.value.data_source
                    name        = metric_query.value.name
                    query       = metric_query.value.query
                  }
                }
              }
            }
          }
          query_interval_seconds = time_slice.value.query_interval_seconds
          threshold              = time_slice.value.threshold
        }
      }
    }
  }
}

