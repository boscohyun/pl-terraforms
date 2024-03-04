resource "aws_ecs_service" "ecs_service" {
  name        = "${var.cluster_name}-ecs-service-zeroc-${var.environment}"
  cluster     = var.create_cluster ? aws_ecs_cluster.ecs_cluster[0].id : var.cluster_id
  launch_type = "FARGATE"

  task_definition      = aws_ecs_task_definition.zeroc_task.arn
  force_new_deployment = false
  desired_count        = var.desired_count

  load_balancer {
    target_group_arn = aws_lb_target_group.zeroc_tg.arn
    container_name   = "zeroc"
    container_port   = 5009
  }

  network_configuration {
    assign_public_ip = true
    subnets          = var.subnets
    security_groups  = [aws_security_group.zeroc_sg.id]
  }

  deployment_minimum_healthy_percent = 0
  deployment_maximum_percent         = 100
}
