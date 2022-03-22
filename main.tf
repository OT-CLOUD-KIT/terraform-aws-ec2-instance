resource "aws_instance" "ec2" {
  count                       = var.count_ec2_instance 
  ami                         = var.ami_id
  instance_type               = var.instance_type
  associate_public_ip_address = var.public_ip
  key_name                    = var.key_name
  subnet_id                   = var.subnet[count.index]
  vpc_security_group_ids      = var.security_groups
  root_block_device {
    volume_size = var.volume_size
  }
  tags = merge(
    {
      Name = format("%s-%d", var.name,count.index+1)
    },
    {
      PROVISIONER = "Terraform"
    },
    var.tags,
  )
}
