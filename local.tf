locals {
  # Standard tag components
  base_name = "${var.env}-${var.app}"

  common_tags = {
   env = var.env
   owner= var.owner
   app = var.app
  }
}

locals {
  selected_instance_id = var.create_ec2_instance ? aws_instance.ec2[0].id : var.existing_instance_id
}


