############################################################
# EC2 Instance Configuration
############################################################
create_ec2_instance  = true
count_ec2_instance   = 1
existing_instance_id = "i-09460f2f0f2b8a8b2"

ami_id        = "ami-0360c520857e3138f"
instance_type = "t2.micro"
private_ip    = null
public_ip     = true
user_data     = ""

iam_instance_profile    = ""
disable_api_termination = false
enable_monitoring       = true
ebs_optimized           = true

############################################################
# Networking
############################################################
subnet  = ["subnet-01dd4647f411cbac8"]
vpc_id  = "vpc-0569ac90e8f4d6d29"
region  = "us-east-1"

############################################################
# Storage - Root Volume
############################################################
volume_size                      = 8
volume_type                      = "gp3"
encrypted_volume                 = true
root_block_iops                  = 3000
root_block_delete_on_termination = true

############################################################
# Storage - Additional EBS Volumes
############################################################
create_ebs_volume          = true
attach_existing_ebs_volume = false

secondary_ebs_volumes = [
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

secondary_existing_ebs_volumes = [
  {
    device_name = "/dev/sdg"
    volume_id   = "vol-0c181fc4efb8832d5"
  }
]

############################################################
# Metadata / Advanced Settings
############################################################
metadata_http_tokens   = "required"
metadata_http_endpoint = "enabled"
metadata_tags          = "enabled"

enable_enclave = false
auto_recovery  = "default"

############################################################
# Security Groups
############################################################
enable_ec2_sg   = true
existing_sg_id  = ""

ec2_ingress_rules = [
  {
    description = "Allow HTTP from all"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr        = ["0.0.0.0/0"]
  },
  {
    description = "Allow HTTPS from all"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr        = ["0.0.0.0/0"]
  },
  {
    description = "Allow SSH from all"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr        = ["0.0.0.0/0"]
  }
]

ec2_egress_rules = [
  {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr        = ["0.0.0.0/0"]
  }
]

############################################################
# Key Pair Management
############################################################
key_name              = ""  # Leave blank to generate new key
create_key_pair       = true
create_private_key    = true
key_pair_name         = "ot-key"
private_key_algorithm = "RSA"
private_key_rsa_bits  = 4096
public_key_path       = "" # Leave blank if generating the key
key_output_dir        = "/home/nikita/Downloads/terraform_code/keys"

############################################################
# Naming / Tagging
############################################################
env   = "dev"
owner = "nikita"
app   = "otcloudkit"
