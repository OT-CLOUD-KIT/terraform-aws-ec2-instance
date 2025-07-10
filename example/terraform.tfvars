create_ec2_instance  = true
count_ec2_instance   = 1
existing_instance_id = "i-09460f2f0f2b8a8b2"

ami_id          = "ami-020cba7c55df1f615"
instance_type   = "t2.micro"
key_name        = "terra"
subnet          = ["subnet-045f69efd16f93d00"]
public_ip       = true

iam_instance_profile    = ""
disable_api_termination = false
enable_monitoring       = true
ebs_optimized           = true
user_data               = ""
private_ip              = null

volume_size                      = 8
volume_type                      = "gp3"
encrypted_volume                 = true
root_block_iops                  = 3000
root_block_delete_on_termination = true

metadata_http_tokens   = "required"
metadata_http_endpoint = "enabled"
metadata_tags          = "enabled"

enable_enclave = false
auto_recovery  = "default"



create_ebs_volume          = false
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



################# Naming Convension #####################

random_alphanumeric_len = 4

bu       = "ot"
app      = "bp"
env      = "d"
resource = "instance"
tenant   = ""

special = false
upper   = false
number  = true

gen_no_of_names = 1

team    = "infra"
program = "ot"


enable_public_web_security_group_resource = true
vpc_id ="vpc-0584bf21acbf558a1"
existing_sg_id = ""

