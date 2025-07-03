module "naming" {
  source   = "git@github.com:OT-CLOUD-KIT/terraform-aws-naming.git?ref=dev"
  bu       = var.bu
  env      = var.env
  app      = var.app
  tenant   = var.tenant
  resource = var.resource
}

module "standard_tags" {
  source = "git@github.com:OT-CLOUD-KIT/terraform-aws-standard-tagging.git?ref=dev"

  bu      = var.bu
  program = var.program
  app     = var.app
  team    = var.team
  region  = var.region
  env     = var.env
}

module "ec2_instance" {
  source                  = "../"
  count_ec2_instance      = var.count_ec2_instance
  ami_id                  = var.ami_id
  instance_type           = var.instance_type
  key_name                = var.key_name
  subnet                  = var.subnet
  security_groups         = var.security_groups
  public_ip               = var.public_ip
  iam_instance_profile    = var.iam_instance_profile
  disable_api_termination = var.disable_api_termination
  enable_monitoring       = var.enable_monitoring
  ebs_optimized           = var.ebs_optimized
  user_data               = var.user_data != "" ? var.user_data : null
  private_ip              = var.private_ip

  volume_size                      = var.volume_size
  volume_type                      = var.volume_type
  encrypted_volume                 = var.encrypted_volume
  root_block_iops                  = var.root_block_iops
  root_block_delete_on_termination = var.root_block_delete_on_termination
  bu                               = var.bu
  program                          = var.program
  team                             = var.team
  app                              = var.app
  env                              = var.env

  metadata_http_tokens   = var.metadata_http_tokens
  metadata_http_endpoint = var.metadata_http_endpoint
  metadata_tags          = var.metadata_tags

  enable_enclave = var.enable_enclave
  auto_recovery  = var.auto_recovery
  
}
