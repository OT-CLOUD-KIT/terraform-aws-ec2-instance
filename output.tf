output "instance_ids" {
  value       = aws_instance.ec2[*].id
  description = "List of EC2 instance IDs"
}

output "public_ips" {
  value       = aws_instance.ec2[*].public_ip
  description = "List of public IPs"
}

output "private_ips" {
  value       = aws_instance.ec2[*].private_ip
  description = "List of private IPs"
}
