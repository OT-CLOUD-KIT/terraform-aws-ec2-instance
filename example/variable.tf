variable "create_ec2_instance" {
  description = "Toggle to create EC2 instance"
  type        = bool
  default     = true
}

variable "count_ec2_instance" {
  type    = number
  default = 1
}

variable "existing_instance_id" {
  description = "Provide this when not creating EC2 but need to attach EBS to an existing instance"
  type        = string
  default     = "i-09460f2f0f2b8a8b2"
}

variable "ami_id" {
  type    = string
  default = "ami-020cba7c55df1f615"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "terra"
}

variable "subnet" {
  type    = list(string)
  default = ["subnet-045f69efd16f93d00"]
}

# variable "security_groups" {
#   type    = list(string)
#   default = ["sg-0b00af69d8e23a01e"]
# }

variable "public_ip" {
  type    = bool
  default = true
}

variable "iam_instance_profile" {
  type    = string
  default = ""
}

variable "disable_api_termination" {
  type    = bool
  default = false
}

variable "enable_monitoring" {
  type    = bool
  default = true
}

variable "ebs_optimized" {
  type    = bool
  default = true
}

variable "user_data" {
  type    = string
  default = ""
}

variable "private_ip" {
  type    = string
  default = null
}

variable "volume_size" {
  type    = number
  default = 8
}

variable "volume_type" {
  type    = string
  default = "gp3"
}

variable "encrypted_volume" {
  type    = bool
  default = true
}

variable "root_block_iops" {
  type    = number
  default = 3000
}

variable "root_block_delete_on_termination" {
  type    = bool
  default = true
}

variable "metadata_http_tokens" {
  type    = string
  default = "required"
}

variable "metadata_http_endpoint" {
  type    = string
  default = "enabled"
}

variable "metadata_tags" {
  type    = string
  default = "enabled"
}

variable "enable_enclave" {
  type    = bool
  default = false
}

variable "auto_recovery" {
  type    = string
  default = "default"
}

variable "create_ebs_volume" {
  type    = bool
  default = false
}

variable "attach_existing_ebs_volume" {
  type    = bool
  default = false
}

variable "secondary_ebs_volumes" {
  type = list(object({
    device_name          = string
    volume_size          = number
    encrypted            = bool
    kms_key_id           = optional(string)
    final_snapshot       = optional(bool)
    multi_attach_enabled = optional(bool)
    iops                 = optional(number)
    throughput           = optional(number)
    type                 = string
    snapshot_id          = optional(string)
    outpost_arn          = optional(string)
    tags                 = optional(map(string), {})
  }))
  default = [
    {
      device_name = "/dev/sdf"
      volume_size = 20
      encrypted   = true
      type        = "gp3"
      tags = {
        Purpose = "AppData"
      }
    }
  ]
}

variable "secondary_existing_ebs_volumes" {
  type = list(object({
    device_name = string
    volume_id   = string
  }))
  default = [
    {
      device_name = "/dev/sdg"
      volume_id   = "vol-0c181fc4efb8832d5"
    }
  ]
}

################# Naming convention variables ###################

variable "env" {
  description = "Environment short name. Must be one of: d (dev), p (prod), q (qa), s (stage), g (global)."
  type        = string
  default     = "d"
  validation {
    condition     = contains(["d", "p", "q", "s", "g"], var.env)
    error_message = "env must be one of 'd', 'p', 'q', 's', 'g'."
  }
}

variable "bu" {
  description = "Business unit name (e.g., pcs, ultrasound). Max 5 characters."
  type        = string
  default     = "ot"
  validation {
    condition     = length(var.bu) <= 5
    error_message = "The business unit name must be less than or equal to 5 characters."
  }
}

variable "app" {
  description = "Application name (e.g., network, shared). Max 6 characters."
  type        = string
  default     = "bp"
  validation {
    condition     = length(var.app) <= 6
    error_message = "The app name must be less than or equal to 6 characters."
  }
}

variable "resource" {
  description = "Resource name (e.g., eks, efs, ecr). Max 15 characters."
  type        = string
  default     = "instance"
  validation {
    condition     = length(var.resource) <= 15
    error_message = "The resource name must be less than or equal to 15 characters."
  }
}

variable "tenant" {
  description = "Tenant name (e.g., app1, app2). Max 6 characters."
  type        = string
  default     = ""
  validation {
    condition     = length(var.tenant) <= 6
    error_message = "The tenant name must be less than or equal to 6 characters."
  }
}

variable "enabled_features" {
  type    = list(string)
  default = []
}

variable "random_alphanumeric_len" {
  description = "The length of random alphanumeric string desired. Min: 1, Max: 4."
  type        = number
  default     = 4
  validation {
    condition     = var.random_alphanumeric_len >= 1 && var.random_alphanumeric_len <= 4
    error_message = "The length must be between 1 and 4."
  }
}

variable "special" {
  description = "Include special characters like !@#$%&*()-_=+[]{}<>:? in the generated name."
  type        = bool
  default     = false
}

variable "upper" {
  description = "Include uppercase characters in the generated name."
  type        = bool
  default     = false
}

variable "number" {
  description = "Include numbers in the generated name."
  type        = bool
  default     = true
}

variable "gen_no_of_names" {
  description = "Number of names to generate."
  type        = number
  default     = 1
}

variable "team" {
  description = "The email address of the team who owns the application, ex:digitalops@gehealthcare.com"
  type        = string
  default     = "infra"
}

variable "program" {
  description = "Name of the Program, For ex: OT, BP etc."
  type        = string
  default     = "ot"
}

variable "region" {
  type    = string
  default = "us-east-1"
}


variable "enable_public_web_security_group_resource" {
  type        = bool
  description = "This variable is to create Web Security Group"
  default     = true
}



variable "instance_sg_name" {
  type = string
  default = "dev_sg"
}
variable "vpc_id" {
  type = string
  default = ""
}

variable "existing_sg_id" {
  type = string
  default = ""
}

variable "security_group_ingress_rules" {
  description = "Ingress rules for the security group"
  type = list(object({
    description  = string
    from_port    = number
    to_port      = number
    protocol     = string
    cidr         = list(string)
    source_SG_ID = string
  }))
  default = []
}

variable "security_group_egress_rules" {
  description = "Egress rules for the security group"
  type = list(object({
    description  = string
    from_port    = number
    to_port      = number
    protocol     = string
    cidr         = list(string)
    source_SG_ID = string
  }))
  default = []
}

# variable "instance_sg_ids" {
#   type        = list(string)
#   description = "List of security group IDs to attach to the EC2 instance"
#   default     = []
# }
