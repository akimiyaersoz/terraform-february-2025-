data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
}

variable instance_type {}
variable subnet_id {}
  



data terraform_remote_state vpc{
  backend = "local"
  config = {
    path = "../vpc/terraform.tfstate"
  
  }

}

# output "hello" {
#   value = data.terraform_remote_state.vpc
  
# }
