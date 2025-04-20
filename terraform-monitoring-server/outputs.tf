
output "web-address_monitoring" {
  value = aws_instance.monitoring.public_ip
}

output "ubuntu_arn" {
    value = data.aws_ami.ubuntu_ami.arn
}
output "ubuntu_image_id" {
    value = data.aws_ami.ubuntu_ami.id
}

