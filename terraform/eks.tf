module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.24.2"

  name               = "${var.project_name}-eks"
  kubernetes_version = "1.36"

  endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true

  vpc_id = module.vpc.vpc_id

  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  addons = {
    coredns = {
      most_recent = true
    }

    kube-proxy = {
      most_recent = true
    }

    vpc-cni = {
      most_recent    = true
      before_compute = true
    }

    eks-pod-identity-agent = {
      most_recent    = true
      before_compute = true
    }
  }

  eks_managed_node_groups = {
    general = {
      name = "general"

      instance_types = ["c7i-flex.large"]

      min_size     = 2
      max_size     = 3
      desired_size = 2

      capacity_type = "ON_DEMAND"

      disk_size = 20

      subnet_ids = module.vpc.private_subnets
    }
  }

  tags = {
    Project     = var.project_name
    Environment = var.environment
  }
}