module "ec2_with_optional_ebs" {
  source = "../"

  # -------------------------
  # EC2 Instance Basics
  # -------------------------
  create_ec2_instance  = var.create_ec2_instance
  existing_instance_id = var.existing_instance_id
  count_ec2_instance   = var.count_ec2_instance
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  subnet               = var.subnet
  private_ip           = var.private_ip
  public_ip            = var.public_ip

  # -------------------------
  # Key Pair Handling
  # -------------------------
  key_name             = var.key_name != "" ? var.key_name : null
  create_key_pair       = var.create_key_pair
  create_private_key    = var.create_private_key
  key_pair_name         = var.key_pair_name
  private_key_algorithm = var.private_key_algorithm
  private_key_rsa_bits  = var.private_key_rsa_bits
  public_key_path       = var.public_key_path
  key_output_dir        = var.key_output_dir  

  # -------------------------
  # IAM / Metadata / Monitoring
  # -------------------------
  iam_instance_profile    = var.iam_instance_profile
  disable_api_termination = var.disable_api_termination
  enable_monitoring       = var.enable_monitoring
  ebs_optimized           = var.ebs_optimized
  user_data               = var.user_data != "" ? var.user_data : null

  metadata_http_tokens   = var.metadata_http_tokens
  metadata_http_endpoint = var.metadata_http_endpoint
  metadata_tags          = var.metadata_tags
  enable_enclave         = var.enable_enclave
  auto_recovery          = var.auto_recovery

  # -------------------------
  # Root Volume
  # -------------------------
  volume_size                      = var.volume_size
  volume_type                      = var.volume_type
  encrypted_volume                 = var.encrypted_volume
  root_block_iops                  = var.root_block_iops
  root_block_delete_on_termination = var.root_block_delete_on_termination

  # -------------------------
  # Extra Volumes
  # -------------------------
  create_ebs_volume          = var.create_ebs_volume
  attach_existing_ebs_volume = var.attach_existing_ebs_volume
  secondary_ebs_volumes          = var.secondary_ebs_volumes
  secondary_existing_ebs_volumes = var.secondary_existing_ebs_volumes

  # -------------------------
  # Security Groups
  # -------------------------
  instance_sg_id = var.enable_ec2_sg ? module.ec2_security_group["enabled"].sg_id : (
                    var.existing_sg_id != "" ? var.existing_sg_id : null
                  )

  # -------------------------
  # Tagging
  # -------------------------
  owner = var.owner
  env   = var.env
  app   = var.app
}


module "ec2_security_group" {
  for_each = var.enable_ec2_sg ? { enabled = true } : {}

  source      = "git@github.com:OT-CLOUD-KIT/terraform-aws-security-groups.git?ref=v0.0.2"
  name_sg     = "${var.env}-${var.app}-ec2-sg"
  vpc_id      = var.vpc_id
  provisioner = var.provisioner
  tags        = var.tags

  ingress_rule = var.ec2_ingress_rules
  egress_rule  = var.ec2_egress_rules
}
