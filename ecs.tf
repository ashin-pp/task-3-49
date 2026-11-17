module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "7.6.1"

  cluster_name = "task-3-49-cluster"

  cluster_capacity_providers = ["FARGATE"]

  default_capacity_provider_strategy = {
    FARGATE = {
      weight = 100
      base   = 1
    }
  }

  services = {
    flask = {
      name               = "task-3-49-service"
      family             = "task-3-49-task"
      cpu                = 256
      memory             = 512
      desired_count      = 1
      enable_autoscaling = false

      # Start the new task before the old one stops, so there is a short overlap.
      deployment_minimum_healthy_percent = 100
      deployment_maximum_percent         = 200

      assign_public_ip      = true
      subnet_ids            = module.vpc.public_subnets
      create_security_group = false
      security_group_ids    = [aws_security_group.app.id]

      create_task_exec_iam_role = false
      task_exec_iam_role_arn    = aws_iam_role.execution.arn
      create_tasks_iam_role     = false

      container_definitions = {
        flask = {
          name      = "flask"
          image     = var.container_image
          essential = true

          portMappings = [
            {
              name          = "flask"
              containerPort = 5000
              protocol      = "tcp"
            }
          ]

          readonlyRootFilesystem = false

          enable_cloudwatch_logging              = true
          create_cloudwatch_log_group            = true
          cloudwatch_log_group_name              = "/ecs/task-3-49"
          cloudwatch_log_group_retention_in_days = 7
        }
      }
    }
  }
}
