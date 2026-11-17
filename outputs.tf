output "github_actions_role_arn" {
  description = "Role ARN to put in the workflow role-to-assume input"
  value       = aws_iam_role.github_actions.arn
}

output "ecs_service_arn" {
  description = "ARN allowed by task-3-49-deploy-policy"
  value       = module.ecs.services["flask"].id
}

output "cluster_name" {
  description = "ECS cluster name"
  value       = module.ecs.cluster_name
}

output "service_name" {
  description = "ECS service name"
  value       = module.ecs.services["flask"].name
}

output "app_url_hint" {
  description = "The task public IP is assigned after the task is running. Open port 5000 on that IP."
  value       = "aws ecs list-tasks --cluster task-3-49-cluster --service-name task-3-49-service"
}
