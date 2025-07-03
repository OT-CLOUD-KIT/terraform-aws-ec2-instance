# Terraform AWS EC2 Instance

A Terraform module to create AWS EC2 instances with customizable configuration including volume size, instance type, tags, key pair, public IP assignment, and more.

---

## Architecture
![Screenshot from 2025-07-04 00-11-31](https://github.com/user-attachments/assets/8da01434-616a-42ae-a489-04827226936b)


> **Note:**  
> This module supports deploying multiple EC2 instances using `count` and provides flexible tagging and network configuration.

---


## Providers

| Name                                              | Version  |
|---------------------------------------------------|----------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.82.2   |
| <a name="terraform_module"></a> [Terraform](Terraform\module) | >= 1.12.1|

---

## Usage

```hcl
module "ec2_instance" {
  source                  = "OT-CLOUD-KIT/terraform-aws-ec2-instance"
  count_ec2_instance      = 1
  ami_id                  = "ami-0ae34e0776a7412f2"
  instance_type           = "t2.micro"
  key_name                = "terra"
  subnet                  = "subnet-08a2aa30dbc179a2b"
  security_groups         = ["sg-04fb2f273d8865af3"]
  public_ip               = true
  iam_instance_profile    = ""
  disable_api_termination = false
  enable_monitoring       = true
  ebs_optimized           = false
  user_data               = null
  private_ip              = "10.0.1.100"

  volume_size                      = 20
  volume_type                      = "gp2"
  encrypted_volume                 = true
  root_block_iops                  = 100
  root_block_delete_on_termination = true
  bu                               = "bp"
  program                          = "infra"
  team                             = "devops"
  app                              = "ot"
  env                              = "d"

  metadata_http_tokens   = "required"
  metadata_http_endpoint = "enabled"
  metadata_tags          = "enabled"

  enable_enclave = false
  auto_recovery  = true
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_count_ec2_instance"></a> [count\_ec2\_instance](#input\_count\_ec2\_instance) | Number of EC2 instances to launch | `number` | `1` | no |
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | AMI ID for the EC2 instance | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | EC2 instance type | `string` | `"t2.micro"` | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | SSH key pair name | `string` | `"terra"` | yes |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | Subnet ID for the instance | `string` | n/a | yes |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | List of security group IDs | `list(string)` | n/a | yes |
| <a name="input_public_ip"></a> [public\_ip](#input\_public\_ip) | Associate public IP | `bool` | `true` | no |
| <a name="input_iam_instance_profile"></a> [iam\_instance\_profile](#input\_iam\_instance\_profile) | IAM instance profile name | `string` | `""` | no |
| <a name="input_disable_api_termination"></a> [disable\_api\_termination](#input\_disable\_api\_termination) | Prevent instance termination | `bool` | `false` | no |
| <a name="input_enable_monitoring"></a> [enable\_monitoring](#input\_enable\_monitoring) | Enable detailed monitoring | `bool` | `false` | no |
| <a name="input_ebs_optimized"></a> [ebs\_optimized](#input\_ebs\_optimized) | Enable EBS optimization | `bool` | `false` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | User data script | `string` | `""` | no |
| <a name="input_private_ip"></a> [private\_ip](#input\_private\_ip) | Static private IP | `string` | `null` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | Root EBS volume size (GiB) | `number` | `8` | yes |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | Root EBS volume type | `string` | `"gp3"` | yes |
| <a name="input_encrypted_volume"></a> [encrypted\_volume](#input\_encrypted\_volume) | Encrypt the root EBS volume | `bool` | `true` | yes |
| <a name="input_root_block_iops"></a> [root\_block\_iops](#input\_root\_block\_iops) | IOPS for root volume | `number` | `3000` | no |
| <a name="input_root_block_delete_on_termination"></a> [root\_block\_delete\_on\_termination](#input\_root\_block\_delete\_on\_termination) | Delete root volume on termination | `bool` | `true` | no |
| <a name="input_metadata_http_tokens"></a> [metadata\_http\_tokens](#input\_metadata\_http\_tokens) | Metadata token setting (`optional`, `required`) | `string` | `"required"` | no |
| <a name="input_metadata_http_endpoint"></a> [metadata\_http\_endpoint](#input\_metadata\_http\_endpoint) | Metadata endpoint (`enabled`, `disabled`) | `string` | `"enabled"` | no |
| <a name="input_metadata_tags"></a> [metadata\_tags](#input\_metadata\_tags) | Enable instance metadata tags | `string` | `"enabled"` | no |
| <a name="input_enable_enclave"></a> [enable\_enclave](#input\_enable\_enclave) | Enable Nitro enclaves | `bool` | `false` | no |
| <a name="input_auto_recovery"></a> [auto\_recovery](#input\_auto\_recovery) | Auto recovery setting | `string` | `"default"` | no |


___


## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_ids"></a> [instance\_ids](#output\_instance\_ids) | IDs of the EC2 instances |
| <a name="output_public_ips"></a> [public\_ips](#output\_public\_ips) | Public IPs of the EC2 instances |
| <a name="output_private_ips"></a> [private\_ips](#output\_private\_ips) | Private IPs of the EC2 instances |


## Contributors

- [Piyush Upadhyay](https://github.com/piiiyuushh)
- [Nikita Joshi](https://github.com/jnikita19)



