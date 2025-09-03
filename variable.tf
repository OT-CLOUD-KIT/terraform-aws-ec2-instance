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
  description = "List of subnets for multiple EC2s"
  type        = list(string)
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


variable "instance_sg_id" {
  type        = string
  default     = ""
  description = " SG IDs to attach to the EC2 instance"
}


######################## key pair  ##################3333

variable "create_key_pair" {
  description = "Whether to create the EC2 key pair"
  type        = bool
  default     = true
}

variable "create_private_key" {
  description = "Whether to generate a private key (if false, public key must be provided)"
  type        = bool
  default     = true
}

variable "key_pair_name" {
  description = "Name of the EC2 key pair"
  type        = string
  default     = "ot-key"
}

variable "public_key_path" {
  description = "Path to an existing public key file (used if create_private_key = false)"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "private_key_algorithm" {
  description = "Algorithm for private key generation"
  type        = string
  default     = "RSA"
}

variable "private_key_rsa_bits" {
  description = "Bit size of RSA key"
  type        = number
  default     = 4096
}

variable "key_output_dir" {
  description = "Directory to write the generated private key"
  type        = string
  default     = "./keys"
}

variable "owner" {
  type = string
  default = ""
  
}


variable "env" {
  type = string
  default = "dev"
}

variable "app" {
  type = string
  default = "otcloud kit"
}