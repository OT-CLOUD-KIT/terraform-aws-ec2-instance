terraform {
  backend "s3" {
    bucket = "ot-cloud-kit-bucket"
    key    = "ot/module/EC2/terraform.tfstate"
    region = "us-east-1"

  }
}