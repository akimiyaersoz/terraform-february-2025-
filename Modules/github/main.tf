provider aws{
    region = "us-east-1"
}

module "vpc1" {
  source  = "git@github.com:akimiyaersoz/terraform-aws-vpc1.git?ref=v0.1.0"

vpc_cidr = "172.31.0.0/16"
subnet1_cidr = "172.31.1.0/24"
#subnet2_cidr = "172.31.2.0/24"
environment = "stage"
}