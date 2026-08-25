provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "DevOps-Kubernetes-Project"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}