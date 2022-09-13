variable "name" {
  description = "Name of bastion"
  type        = string
  default     = ""
}
variable "public_ip" {
  description = "Name of bastion"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
variable "subnet" {
  description = "Zones to launch our instances into"
  type        = string
  default     = ""
}
variable "volume_size" {
  description = "volume size"
  type        = number
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

variable "user_data" {
  type        = list(string)
  default     = []
  description = "User data content. Will be ignored if `user_data_base64` is set"
}

variable "user_data_base64" {
  type        = string
  description = "The Base64-encoded user data to provide when launching the instances. If this is set then `user_data` will not be used."
  default     = ""
}

variable "ssh_user" {
  type        = string
  description = "Default SSH user for this AMI. e.g. `ec2-user` for Amazon Linux and `ubuntu` for Ubuntu systems"
  default     = "ec2-user"
}

variable "user_data_template" {
  type        = string
  description = "User Data template to use for provisioning EC2 Bastion Host"
}
