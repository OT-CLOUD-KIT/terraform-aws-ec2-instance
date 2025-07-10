resource "aws_instance" "ec2" {
    count                       = var.create_ec2_instance ? var.count_ec2_instance : 0

  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet
  security_groups = var.instance_sg_id != "" ? [var.instance_sg_id] : null
  associate_public_ip_address = var.public_ip
  iam_instance_profile        = var.iam_instance_profile != "" ? var.iam_instance_profile : null
  disable_api_termination     = var.disable_api_termination
  monitoring                  = var.enable_monitoring
  ebs_optimized               = var.ebs_optimized
  user_data                   = var.user_data != "" ? var.user_data : null
  private_ip                  = var.private_ip

  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    encrypted             = var.encrypted_volume
    iops                  = var.root_block_iops
    delete_on_termination = var.root_block_delete_on_termination
  }

  metadata_options {
    http_tokens            = var.metadata_http_tokens
    http_endpoint          = var.metadata_http_endpoint
    instance_metadata_tags = var.metadata_tags
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

# Get AZ for new EBS volumes
data "aws_subnet" "selected" {
  count = var.create_ebs_volume && length(var.secondary_ebs_volumes) > 0 ? 1 : 0
  id    = var.subnet
}

# Create new EBS volumes
resource "aws_ebs_volume" "new" {
  count                = var.create_ebs_volume ? length(var.secondary_ebs_volumes) : 0
  availability_zone    = data.aws_subnet.selected[0].availability_zone
  size                 = var.secondary_ebs_volumes[count.index].volume_size
  encrypted            = var.secondary_ebs_volumes[count.index].encrypted
  kms_key_id           = var.secondary_ebs_volumes[count.index].kms_key_id
  final_snapshot       = var.secondary_ebs_volumes[count.index].final_snapshot
  multi_attach_enabled = var.secondary_ebs_volumes[count.index].multi_attach_enabled
  iops                 = var.secondary_ebs_volumes[count.index].iops
  throughput           = var.secondary_ebs_volumes[count.index].throughput
  type                 = var.secondary_ebs_volumes[count.index].type
  snapshot_id          = var.secondary_ebs_volumes[count.index].snapshot_id
  outpost_arn          = var.secondary_ebs_volumes[count.index].outpost_arn

 tags = merge(
    local.common_tags,
    {
      Name = "${local.base_name}-ebs-${count.index + 1}"
    },
    var.secondary_ebs_volumes[count.index].tags
  )
}

# Attach new EBS volumes
resource "aws_volume_attachment" "new" {
  count       = var.create_ebs_volume ? length(var.secondary_ebs_volumes) : 0
  device_name = var.secondary_ebs_volumes[count.index].device_name
  volume_id   = aws_ebs_volume.new[count.index].id
  instance_id = local.selected_instance_id

  depends_on = [aws_instance.ec2]
}

# Attach existing EBS volumes
resource "aws_volume_attachment" "existing" {
  count       = var.attach_existing_ebs_volume && length(var.secondary_existing_ebs_volumes) > 0 ? length(var.secondary_existing_ebs_volumes) : 0
  device_name = var.secondary_existing_ebs_volumes[count.index].device_name
  volume_id   = var.secondary_existing_ebs_volumes[count.index].volume_id
  instance_id = local.selected_instance_id

  depends_on = [aws_instance.ec2]
}
