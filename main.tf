locals {
  user_data_templated = templatefile("${var.user_data_template}", {
    user_data = join("\n", var.user_data)
    ssh_user  = var.ssh_user
  })
}

resource "aws_instance" "ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = var.public_ip
  key_name                    = var.key_name
  subnet_id                   = var.subnet
  vpc_security_group_ids      = var.security_groups
  user_data                   = length(var.user_data_base64) > 0 ? var.user_data_base64 : local.user_data_templated
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }
  tags = merge(
    {
      Name = var.name
    },
    {
      PROVISIONER = "Terraform"
    },
    var.tags,
  )
}
