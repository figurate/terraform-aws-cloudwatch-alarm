/**
 * # ![AWS](aws-logo.png) CloudWatch Alarm
 *
 * Purpose: Templates for CloudWatch Alarms.
 */
resource "aws_cloudwatch_metric_alarm" "metric_alarm" {
  count = local.alarms[var.alarm_type]["MetricName"] != null ? 1 : 0

  alarm_name = var.alarm_name
  namespace  = var.namespace
  dimensions = var.dimensions

  alarm_description   = local.alarms[var.alarm_type]["AlarmDescription"]
  comparison_operator = local.alarms[var.alarm_type]["ComparisonOperator"]
  evaluation_periods  = local.alarms[var.alarm_type]["EvaluationPeriods"]
  metric_name         = local.alarms[var.alarm_type]["MetricName"]
  statistic           = local.alarms[var.alarm_type]["Statistic"]
  period              = local.alarms[var.alarm_type]["Period"]
  threshold           = local.alarms[var.alarm_type]["Threshold"]

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions
}

resource "aws_cloudwatch_metric_alarm" "combined_alarm" {
  count = local.alarms[var.alarm_type]["MetricName"] == null ? 1 : 0

  alarm_name = var.alarm_name

  dynamic "metric_query" {
    for_each = local.alarms[var.alarm_type]["Metrics"]
    content {
      id          = metric_query.key
      expression  = local.metrics[metric_query.value]["Expression"]
      return_data = local.metrics[metric_query.value]["ReturnData"]
      dynamic "metric" {
        for_each = local.metrics[metric_query.value]["MetricName"] != null ? [1] : []
        content {
          metric_name = local.metrics[metric_query.value]["MetricName"]
          stat        = local.metrics[metric_query.value]["Statistic"]
          period      = local.metrics[metric_query.value]["Period"]
        }
      }
    }
  }

  alarm_description   = local.alarms[var.alarm_type]["AlarmDescription"]
  comparison_operator = local.alarms[var.alarm_type]["ComparisonOperator"]
  evaluation_periods  = local.alarms[var.alarm_type]["EvaluationPeriods"]
  threshold           = local.alarms[var.alarm_type]["Threshold"]

  alarm_actions = var.alarm_actions
  ok_actions    = var.ok_actions
}
