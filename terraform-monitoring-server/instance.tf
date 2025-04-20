
resource "aws_instance" "monitoring" {
  ami                    = data.aws_ami.ubuntu_ami.id # Ubuntu amd64 (x86_64)
  instance_type          = var.instance_type         # Free tier
  security_groups        = [aws_security_group.node_sg.name]
  key_name               = "ssh_instance_key" # Please use your key name
 
  root_block_device {
    volume_size = 30 # Adjust size based on needs, in GB
    volume_type = "gp3"
  }

  user_data = <<-EOF
            #!/bin/bash
            hostnamectl set-hostname monitoring-server
            echo "127.0.1.1 monitoring-server" >> /etc/hosts
            EOF

  tags = {
    Name = "Monitoring-Server"
  }
}


