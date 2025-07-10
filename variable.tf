################################## EC2 Instance Parameters #########################################

variable "count_ec2_instance" {
  type    = number
  default = 1
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
  type    = string
  default = "subnet-045f69efd16f93d00"
}

variable "security_groups" {
  type    = list(string)
  default = ["sg-0b00af69d8e23a01e"]
}

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

################################## Root Volume #########################################

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

################################## Metadata #########################################

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

################################## Enclave & Maintenance #########################################

variable "enable_enclave" {
  type    = bool
  default = false
}

variable "auto_recovery" {
  type    = string
  default = "default"
}

################################## Conditionals #########################################

variable "create_ec2_instance" {
  type    = bool
  default = true
}

variable "existing_instance_id" {
  description = "Provide this when not creating EC2 but need to attach EBS to an existing instance"
  type        = string
  default     = "i-09460f2f0f2b8a8b2"
}

variable "create_ebs_volume" {
  type    = bool
  default = false
}

variable "attach_existing_ebs_volume" {
  type    = bool
  default = false
}

################################## Dynamic EBS Volumes #########################################

variable "secondary_ebs_volumes" {
  type = list(object({
    device_name           = string
    volume_size           = number
    encrypted             = bool
    kms_key_id            = optional(string)
    final_snapshot        = optional(bool)
    multi_attach_enabled  = optional(bool)
    iops                  = optional(number)
    throughput            = optional(number)
    type                  = string
    snapshot_id           = optional(string)
    outpost_arn           = optional(string)
    tags                  = optional(map(string), {})
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

################################## Naming Convention Variables #########################################

variable "bu" {
  description = "Business unit name (e.g., BP, GURUKU). Max 6 characters."
  type        = string
  default     = "BP"
  validation {
    condition     = length(var.bu) <= 6
    error_message = "The business unit name must be less than or equal to 6 characters."
  }
}

variable "program" {
  description = "Name of the program (e.g., OT, BP)."
  type        = string
  default     = "OT"
}

variable "app" {
  description = "Application name (e.g., network, shared). Max 10 characters."
  type        = string
  default     = "network"
  validation {
    condition     = length(var.app) <= 10
    error_message = "The app name must be less than or equal to 10 characters."
  }
}

variable "env" {
  description = "Environment code: 'd' (dev), 'p' (prod), 'q' (qa), 's' (stage), 'g' (global)."
  type        = string
  default     = "d"
  validation {
    condition     = contains(["d", "p", "q", "s", "g"], var.env)
    error_message = "env must be one of 'd', 'p', 'q', 's', 'g'."
  }
}

variable "team" {
  description = "Team email responsible for the application (e.g., digitalops@gehealthcare.com)."
  type        = string
  default     = "infra"
}

variable "region" {
  description = "AWS region (e.g., us-east-1, ap-south-1)."
  type        = string
  default     = "us-east-1"
}
