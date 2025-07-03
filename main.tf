resource "aws_instance" "ec2" {
  count                       = var.count_ec2_instance
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet
  vpc_security_group_ids      = var.security_groups
  associate_public_ip_address = var.public_ip
  iam_instance_profile        = var.iam_instance_profile != "" ? var.iam_instance_profile : null
  disable_api_termination     = var.disable_api_termination
  monitoring                  = var.enable_monitoring
  ebs_optimized               = var.ebs_optimized
  user_data = var.user_data != "" ? var.user_data : null
  private_ip                  = var.private_ip

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    encrypted             = var.encrypted_volume
    iops                  = var.root_block_iops
    delete_on_termination = var.root_block_delete_on_termination
  }

 

  metadata_options {
    http_tokens               = var.metadata_http_tokens
    http_endpoint             = var.metadata_http_endpoint
    instance_metadata_tags    = var.metadata_tags
  }

  enclave_options {
    enabled = var.enable_enclave
  }

  maintenance_options {
    auto_recovery = var.auto_recovery
  }

  tags = merge(
    {
      Name = "${local.base_name}-ec2-${count.index}"
    },
    local.common_tags
  )
}
