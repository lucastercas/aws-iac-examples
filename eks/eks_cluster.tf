module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "iac_lab_cluster"
  cluster_version = "1.20"
  subnets         = data.aws_subnet_ids.private.ids

  tags = {
    Environment = "iac_lab"
    GithubRepo  = "terraform-aws-eks"
    GithubOrg   = "terraform-aws-modules"
  }

  vpc_id = data.aws_vpc.vpc.id

  workers_group_defaults = {
    root_volume_type = "gp2"
  }

  worker_groups = [
    {
      name                          = "worker-group-1"
      instance_type                 = "t2.small"
      additional_userdata           = "echo foo bar"
      asg_desired_capacity          = 2
      # additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
    },
    # {
    #   name                          = "worker-group-2"
    #   instance_type                 = "t2.medium"
    #   additional_userdata           = "echo foo bar"
    #   # additional_security_group_ids = [aws_security_group.worker_group_mgmt_two.id]
    #   asg_desired_capacity          = 1
    # },
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
