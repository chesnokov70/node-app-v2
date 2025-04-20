data "aws_ami" "ubuntu_ami" {
  most_recent = true
  
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
  
  filter {
    name = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "owner-id"
    values = ["099720109477"] # Canonical's AWS account ID
  }

  filter {
    name   = "state"
    values = ["available"]
  }

}
