resource "aws_instance" "node_docker" {
  ami                    = data.aws_ami.ubuntu_ami.id
  instance_type          = var.instance_type
  security_groups        = [aws_security_group.node_sg.name]
  key_name               = "ssh_instance_key"

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  user_data = <<-EOF
            #!/bin/bash
            hostnamectl set-hostname node-app
            echo "127.0.1.1 node-app-v2" >> /etc/hosts
            EOF

  tags = {
    Name = "NodeAppServer-v2"
  }
}

