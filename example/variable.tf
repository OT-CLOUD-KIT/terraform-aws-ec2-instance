variable "count_ec2_instance" {
  type        = number
  default     = 1
}

variable "ami_id" {
  type        = string
  default     = "ami-020cba7c55df1f615"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  default     = "terra"
}

variable "subnet" {
  type        = string
  default     = "subnet-08a2aa30dbc179a2b"
}

variable "security_groups" {
  type        = list(string)
  default     = ["sg-04fb2f273d8865af3"]
}

variable "public_ip" {
  type        = bool
  default     = true
}

variable "iam_instance_profile" {
  type        = string
  default     = ""
}

variable "disable_api_termination" {
  type        = bool
  default     = false
}

variable "enable_monitoring" {
  type        = bool
  default     = false
}

variable "ebs_optimized" {
  type        = bool
  default     = false
}

variable "user_data" {
  type        = string
  default     = ""
}

variable "private_ip" {
  type        = string
  default     = null
}

variable "volume_size" {
  type        = number
  default     = 8
}

variable "volume_type" {
  type        = string
  default     = "gp3"
}

variable "encrypted_volume" {
  type        = bool
  default     = true
}

variable "root_block_iops" {
  type        = number
  default     = 3000
}

variable "root_block_delete_on_termination" {
  type        = bool
  default     = true
}

variable "metadata_http_tokens" {
  type        = string
  default     = "required"
}

variable "metadata_http_endpoint" {
  type        = string
  default     = "enabled"
}

variable "metadata_tags" {
  type        = string
  default     = "enabled"
}

variable "enable_enclave" {
  type        = bool
  default     = false
}

variable "auto_recovery" {
  type        = string
  default     = "default"
}

################### Naming convention variables ###################

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
  description = "Resource name (e.g., eks, efs, ecr). Max 8 characters."
  type        = string
  default     = "network"
  validation {
    condition     = length(var.resource) <= 8
    error_message = "The resource name must be less than or equal to 8 characters."
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
  type        = list(string)
  default     = []
}

variable "create" {
  description = "Controls if resources should be created (affects nearly all resources)"
  type        = bool
  default     = true
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
  type        = string
  default     = "us-east-1"
}
