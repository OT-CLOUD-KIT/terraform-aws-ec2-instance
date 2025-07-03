count_ec2_instance = 1

ami_id          = "ami-020cba7c55df1f615"
instance_type   = "t2.micro"
key_name        = "terra"
subnet          = "subnet-08a2aa30dbc179a2b"
security_groups = ["sg-04fb2f273d8865af3"]
public_ip       = true

iam_instance_profile    = ""
disable_api_termination = false
enable_monitoring       = false
ebs_optimized           = false
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


################# Naming Convension #####################

random_alphanumeric_len = 4

bu       = "ot"
app      = "bp"
env      = "d"
resource = "network"
tenant   = ""

special = false
upper   = false
number  = true

gen_no_of_names = 1

team    = "infra"
program = "ot"