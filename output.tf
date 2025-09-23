output "ec2_instance_ids" {
  value = aws_instance.ec2[*].id
}

output "new_ebs_volume_ids" {
  value = aws_ebs_volume.new[*].id
}
