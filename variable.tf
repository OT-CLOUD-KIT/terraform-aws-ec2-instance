variable "count_ec2_instance" {
  type        = number
  description = "Number of EC2 instances"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "Key pair name for SSH access"
}

variable "subnet" {
  type        = string
  description = "Subnet ID where the instance will be launched"
}

variable "security_groups" {
  type        = list(string)
  description = "List of security group IDs"
}

variable "public_ip" {
  type        = bool
  description = "Whether to associate a public IP"
}

variable "iam_instance_profile" {
  type        = string
  description = "IAM instance profile name"
  default     = ""
}

variable "disable_api_termination" {
  type        = bool
  description = "Whether to disable API termination"
  default     = false
}

variable "enable_monitoring" {
  type        = bool
  description = "Enable detailed monitoring"
  default     = false
}

variable "ebs_optimized" {
  type        = bool
  description = "Enable EBS optimization"
  default     = false
}

variable "user_data" {
  type        = string
  description = "User data script"
  default     = ""
}

variable "private_ip" {
  type        = string
  description = "Private IP address to assign"
  default     = null
}

variable "volume_size" {
  type        = number
  description = "Size of root volume in GB"
}

variable "volume_type" {
  type        = string
  description = "Type of root volume (e.g., gp3, io1)"
}

variable "encrypted_volume" {
  type        = bool
  description = "Whether the root volume should be encrypted"
}

variable "root_block_iops" {
  type        = number
  description = "IOPS for root volume (used with io1, io2, gp3)"
  default     = null
}

variable "root_block_delete_on_termination" {
  type        = bool
  description = "Delete root volume on termination"
  default     = true
}



variable "metadata_http_tokens" {
  type        = string
  description = "IMDSv2 token requirement (optional/required)"
  default     = "required"
}

variable "metadata_http_endpoint" {
  type        = string
  description = "Enable/disable metadata endpoint"
  default     = "enabled"
}

variable "metadata_tags" {
  type        = string
  description = "Include instance tags in metadata"
  default     = "enabled"
}

variable "enable_enclave" {
  type        = bool
  description = "Enable Nitro enclaves"
  default     = false
}

variable "auto_recovery" {
  type        = string
  description = "Enable or disable auto recovery"
  default     = "default"
}




################################### Naming convention variables #########################################

variable "bu" {
  description = "Business unit name (e.g., BP, GURUKU). Max 6 characters."
  type        = string
  default = "BP"
  validation {
    condition     = length(var.bu) <= 6
    error_message = "The business unit name must be less than or equal to 6 characters."
  }
}

variable "program" {
  description = "Name of the program (e.g., OT, BP)."
  type        = string
  default = "OT"
}

variable "app" {
  description = "Application name (e.g., network, shared). Max 6 characters."
  type        = string
  default = "network"
  validation {
    condition     = length(var.app) <= 10
    error_message = "The app name must be less than or equal to 10 characters."
  }
}

variable "env" {
  description = "Environment code: 'd' (dev), 'p' (prod), 'q' (qa), 's' (stage), 'g' (global)."
  type        = string
  default = "d"

  validation {
    condition     = contains(["d", "p", "q", "s", "g"], var.env)
    error_message = "env must be one of 'd', 'p', 'q', 's', 'g'."
  }
}

variable "team" {
  description = "Team email responsible for the application (e.g., digitalops@gehealthcare.com)."
  type        = string
  default = "infra"
}

variable "region" {
  description = "AWS region (e.g., us-east-1, ap-south-1)."
  type        = string
  default = "us-east-1"
}
