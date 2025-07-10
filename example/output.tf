output "ec2_instance_ids" {
  value = module.ec2_with_optional_ebs.ec2_instance_ids
}

output "new_ebs_volume_ids" {
  value = module.ec2_with_optional_ebs.new_ebs_volume_ids
}

output "web_sg_id" {
  value = var.enable_public_web_security_group_resource ? module.instance_security_group : null
}