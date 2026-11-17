variable "aws_region" {
  description = "Region for this stack"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.49.0.0/16"
}

variable "az" {
  description = "Single Availability Zone for the public subnet"
  type        = string
  default     = "us-east-1a"
}

variable "public_subnet_cidr" {
  description = "CIDR for the one public subnet"
  type        = string
  default     = "10.49.1.0/24"
}

variable "container_image" {
  description = "Public Docker Hub image. ECS pulls :latest only when a deployment is forced."
  type        = string
  default     = "ashin4132/task-3-49-app:latest"
}

variable "github_repository" {
  description = "GitHub repository allowed to assume the deploy role, without the repo: prefix"
  type        = string
  default     = "ashin-pp/task-3-49"
}

variable "github_owner_id" {
  description = "Numeric GitHub user id included in the OIDC subject"
  type        = string
  default     = "213789079"
}

variable "github_repository_id" {
  description = "Numeric GitHub repository id included in the OIDC subject"
  type        = string
  default     = "1461017166"
}
