module "vpc" {

  source              = "./modules/vpc"
  cluster-name        = "EKS-Cluster-Demo"
  vpc-name            = "EKS-VPC-Demo"
  vpc-cidr            = "10.0.0.0/16"
  public-subnets-data = [{ name = "public-subnet1", ipsec = "10.0.1.0/24", az = "ap-south-1a" }, { name = "public-subnet2", ipsec = "10.0.2.0/24", az = "ap-south-1b" }, { name = "public-subnet3", ipsec = "10.0.3.0/24", az = "ap-south-1c" }]
}

module "eks" {
  extra_depends_on = [module.vpc]
  source           = "./modules/eks"
  cluster-name     = "EKS-Cluster-Demo"
  subnets-id       = module.vpc.public-subnet-id
}
