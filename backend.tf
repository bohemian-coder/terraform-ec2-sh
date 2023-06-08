terraform {
  backend "s3" {
    bucket = "terra-state-mk"
    key    = "terraform/backend_tfvpcsh"
    region = "us-east-1"
  }
}