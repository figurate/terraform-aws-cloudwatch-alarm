module "ecs_alarm" {
  source = "../.."

  alarm_name = var.alarm_name
  alarm_type = var.alarm_type
  namespace  = "AWS/ECS"
  dimensions = {
    ClusterName = var.cluster_name
  }
  evaluation_periods = var.evaluation_periods
  threshold          = var.threshold
  alarm_actions      = var.alarm_actions
  ok_actions         = var.ok_actions
}
