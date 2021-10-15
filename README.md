AWS EC2 Instance Terraform module
=====================================

[![Opstree Solutions][opstree_avatar]][opstree_homepage]

[Opstree Solutions][opstree_homepage] 

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

Terraform module which creates EC2 Instance on AWS.

These types of resources are supported:

* [EC2](https://www.terraform.io/docs/providers/aws/r/instance.html)

Terraform versions
------------------

Terraform 0.12.

Usage
------

```hcl
provider "aws" {
  region = "ap-south-1"
}

module "instance" {
  source                  = "../ec2Instance"
  count                   = var.count
  name                    = "node_1"
  tags                    = local.tags_map
  instance_type           = var.instance_type
  key_name                = var.key_name
  volume_size             = var.volume_size
  subnet                  = var.subnet_id
  security_groups        = var.sg_id
  ami_id                  = var.ami_id
  public_ip               = true 
  
}

```

```
output "instance_ip" {
  description = "instance ip"
  value       = module.instance.private_ip
}
output "instance_id" {
  description = "instance id"
  value       = module.instance.instance_id
}
```
Tags
----
* Tags are assigned to resources with name variable as prefix.
* Additial tags can be assigned by tags variables as defined above.

Inputs
------
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| count | Number of ec2 Instance | `Number` | `1` | no |
| name | The string for name of the instance | `string` | `"false"` | yes |
| tags | The tags for ec2 instance   | `string` | `"false"` | no |
| instance_type | You can define the type of instance | `string` | `"false"` | yes |
| key_name | Name of the key that you have to define while create an key | `string` | `"false"` | yes |
| volume_size | Define size of EBS volume  | `number` | `"false"` | yes |
| subnet |define subnet to launch ec2 instace to particular subnet | `string` | `"false"` | yes |
| security_groups |define security group to attach an instace to particular subnet | `list` | `"false"` | yes |
| ami_id |define ami_id for ec2 instance | `string` | `"false"` | yes |
| public_ip |define public_ip for ec2 instance | `bool` | `"false"` | no |


Output
------
| Name | Description |
|------|-------------|
| instance_ip | The IP of the instance |
| instance_id | The ID of the instance |

## Related Projects

Check out these related projects.

- [security_group](https://github.com/OT-CLOUD-KIT/terraform-aws-network-skeleton) - Terraform module for creating dynamic Security 

### Contributors

[![Devesh Sharma][devesh_avataar]][devesh_homepage]<br/>[Devesh Sharma][devesh_homepage] 

  [devesh_homepage]: https://github.com/deveshs23
  [devesh_avataar]: https://img.cloudposse.com/150x150/https://github.com/deveshs23.png
