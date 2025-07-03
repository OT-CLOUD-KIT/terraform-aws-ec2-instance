output "instance_ids" {
  value       = module.ec2_instance.instance_ids
  description = "IDs of the EC2 instances"
}

output "public_ips" {
  value       = module.ec2_instance.public_ips
  description = "Public IPs of the EC2 instances"
}

output "private_ips" {
  value       = module.ec2_instance.private_ips
  description = "Private IPs of the EC2 instances"
}
