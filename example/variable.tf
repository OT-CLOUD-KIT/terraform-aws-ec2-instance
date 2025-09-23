############################################################
# EC2 Instance Configuration
############################################################
variable "create_ec2_instance" {
  description = "Toggle to create EC2 instance"
  type        = bool
  default     = true
}

variable "count_ec2_instance" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 1
}

variable "existing_instance_id" {
  description = "Provide this when not creating EC2 but need to attach EBS to an existing instance"
  type        = string
  default     = ""
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-020cba7c55df1f615"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "private_ip" {
  description = "Private IP address for EC2 instance"
  type        = string
  default     = null
}

variable "public_ip" {
  description = "Whether to assign a public IP"
  type        = bool
  default     = true
}

variable "iam_instance_profile" {
  description = "IAM instance profile for EC2"
  type        = string
  default     = ""
}

variable "disable_api_termination" {
  description = "Prevent accidental termination of the instance"
  type        = bool
  default     = false
}

variable "enable_monitoring" {
  description = "Enable detailed CloudWatch monitoring"
  type        = bool
  default     = true
}

variable "ebs_optimized" {
  description = "Enable EBS optimized instance"
  type        = bool
  default     = true
}

variable "user_data" {
  description = "User data script for EC2 instance"
  type        = string
  default     = ""
}

############################################################
# Networking
############################################################
variable "subnet" {
  description = "List of subnet IDs where EC2 will be launched"
  type        = list(string)
  default     = []
}

variable "vpc_id" {
  description = "VPC ID where EC2 is launched"
  type        = string
  default     = ""
}

############################################################
# Storage - Root Volume
############################################################
variable "volume_size" {
  description = "Root volume size in GB"
  type        = number
  default     = 8
}

variable "volume_type" {
  description = "Root volume type (gp3, io1, etc.)"
  type        = string
  default     = "gp3"
}

variable "encrypted_volume" {
  description = "Whether to encrypt the root volume"
  type        = bool
  default     = true
}

variable "root_block_iops" {
  description = "IOPS for root block volume (gp3/io1/io2)"
  type        = number
  default     = 3000
}

variable "root_block_delete_on_termination" {
  description = "Delete root volume on termination"
  type        = bool
  default     = true
}

############################################################
# Storage - Additional EBS Volumes
############################################################
variable "create_ebs_volume" {
  description = "Whether to create an additional EBS volume"
  type        = bool
  default     = false
}

variable "attach_existing_ebs_volume" {
  description = "Whether to attach an existing EBS volume"
  type        = bool
  default     = false
}

variable "secondary_ebs_volumes" {
  description = "List of secondary EBS volumes to create"
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
  default = []
}

variable "secondary_existing_ebs_volumes" {
  description = "List of existing secondary EBS volumes to attach"
  type = list(object({
    device_name = string
    volume_id   = string
  }))
  default = []
}

############################################################
# Metadata / Advanced Settings
############################################################
variable "metadata_http_tokens" {
  description = "Whether to require IMDSv2 tokens"
  type        = string
  default     = "required"
}

variable "metadata_http_endpoint" {
  description = "Whether metadata service is enabled"
  type        = string
  default     = "enabled"
}

variable "metadata_tags" {
  description = "Whether metadata tags are enabled"
  type        = string
  default     = "enabled"
}

variable "enable_enclave" {
  description = "Enable Nitro enclave support"
  type        = bool
  default     = false
}

variable "auto_recovery" {
  description = "Enable EC2 instance auto-recovery"
  type        = string
  default     = "default"
}

############################################################
# Security Groups
############################################################
variable "enable_ec2_sg" {
  description = "Enable or disable creation of EC2 security group"
  type        = bool
  default     = true
}

variable "existing_sg_id" {
  description = "Existing security group ID (if not creating new one)"
  type        = string
  default     = ""
}

variable "ec2_ingress_rules" {
  description = "Ingress rules for the EC2 security group"
  type = list(object({
    description  = string
    from_port    = number
    to_port      = number
    protocol     = string
    cidr         = optional(list(string))
    ipv6_cidr    = optional(list(string))
    source_SG_ID = optional(string)
  }))
  default = []
}

variable "ec2_egress_rules" {
  description = "Egress rules for the EC2 security group"
  type = list(object({
    description  = string
    from_port    = number
    to_port      = number
    protocol     = string
    cidr         = optional(list(string))
    ipv6_cidr    = optional(list(string))
    source_SG_ID = optional(string)
  }))
  default = []
}

############################################################
# Key Pair Management
############################################################
variable "key_name" {
  description = "Existing key pair name (if using existing)"
  type        = string
  default     = ""
}

variable "create_key_pair" {
  description = "Whether to create a new key pair"
  type        = bool
  default     = false
}

variable "create_private_key" {
  description = "Whether to generate a TLS private key"
  type        = bool
  default     = false
}

variable "key_pair_name" {
  description = "Name of the key pair (if creating new one)"
  type        = string
  default     = "default-key"
}

variable "private_key_algorithm" {
  description = "Algorithm for TLS private key"
  type        = string
  default     = "RSA"
}

variable "private_key_rsa_bits" {
  description = "RSA key bits"
  type        = number
  default     = 4096
}

variable "public_key_path" {
  description = "Path to public key (if not generating key)"
  type        = string
  default     = ""
}

variable "key_output_dir" {
  description = "Directory to save generated keys"
  type        = string
  default     = "./keys"
}

############################################################
# Naming / Tagging
############################################################
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "app" {
  description = "Application name"
  type        = string
  default     = ""
}

variable "env" {
  description = "Environment name"
  type        = string
  default     = ""
}

variable "owner" {
  description = "Owner tag"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}

variable "provisioner" {
  description = "Provisioner name"
  type        = string
  default     = "terraform"
}
