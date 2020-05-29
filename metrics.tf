locals {
  alarms = {
    cpu_high = {
      AlarmDescription   = "High CPU reservation alarm"
      MetricName         = "CPUReservation"
      Statistic          = "Average"
      Period             = 300
      EvaluationPeriods  = var.evaluation_periods
      Threshold          = var.threshold
      ComparisonOperator = "GreaterThanOrEqualToThreshold"
    }

    memory_high = {
      AlarmDescription   = "High Memory reservation alarm"
      MetricName         = "MemoryReservation"
      Statistic          = "Average"
      Period             = 300
      EvaluationPeriods  = var.evaluation_periods
      Threshold          = var.threshold
      ComparisonOperator = "GreaterThanOrEqualToThreshold"
    }

    cpu_memory_low = {
      Metrics = ["cpu_memory_low", "cpu", "memory"]
    }
  }

  metrics = {
    cpu_memory_low = {
      Expression = "(cpu < ${var.threshold} && memory < ${var.threshold})"
    }

    cpu = {
      ReturnData = false
      MetricName = "CPUReservation"
      Statistic  = "Average"
      Period     = 300
    }

    memory = {
      ReturnData = false
      MetricName = "MemoryReservation"
      Statistic  = "Average"
      Period     = 300
    }
  }
}