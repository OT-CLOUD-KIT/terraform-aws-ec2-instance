variable "count_ec2_instance" {
  description = "number of ec2 instance"
  type        = number
  default     = 1
}

variable "ec2_name" {
  description = "Name of bastion"
  type        = string
  default     = ""
}
variable "public_ip" {
  description = "Public Ip "
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
variable "subnet" {
  description = "Zones to launch our instances into"
}
variable "volume_size" {
  description = "volume size"
  type        = number
  default     = 8 
}

variable "volume_type" {
  description = "volume type"
  type        = string
  default     = "gp2"
}

variable "ami_id" {
  description = "Name of Launch configuration"
  type        = string
  default     = ""
}
variable "key_name" {
  description = "Key name of Launch configuration"
  type        = string
  default     = ""
}
variable "instance_type" {
  description = "Name of Launch configuration"
  type        = string
  default     = ""
}
variable "security_groups" {
  description = "Name of Launch configuration"
  type        = list(string)
  default     = []
}

variable "iam_instance_profile" {
  type = string
  default = ""
}

variable "encrypted_volume" {
type = bool
description = "Optional) Whether to enable volume encryption. Defaults to false. Must be configured to perform drift detection."
default = false
}
