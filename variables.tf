variable "name" {
  description = "Name of instance"
  type        = string
  default     = ""
}
variable "public_ip" {
  description = "enable for public ip"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
variable "subnet" {
  description = "Define subnet"
  type        = string
  default     = ""
}
variable "volume_size" {
  description = "volume size"
  type        = number
}

variable "ami_id" {
  description = "Define ami_id"
  type        = string
  default     = ""
}
variable "key_name" {
  description = "Key name of Launch instance"
  type        = string
  default     = ""
}
variable "instance_type" {
  description = "define instance type ex- t2.large"
  type        = string
  default     = ""
}
variable "security_groups" {
  description = "Define secuity groups"
  type        = list(string)
  default     = []
}

