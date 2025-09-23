terraform {
  backend "s3" {
    bucket = "ot-cloud-kit-bucket-3"
    key    = "ot/module/EC2/terraform.tfstate"
    region = "us-east-1"

  }
}