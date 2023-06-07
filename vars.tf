variable "REGION" {
  default = "us-east-1"
}
variable "ZONE1" {
  default = "us-east-1a"
}
variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0715c1897453cabd1"
    us-east-2 = "ami-01107263728f3bef4"
  }
}
variable "USER" {
  default = "ec2-user"
}