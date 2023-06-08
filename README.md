# Terraform-EC2-SH - Sample Template

A sample template to set up a VPC on AWS. Components are;
- VPC
- Public /Private Subnets
- Internet Gateway
- Route Table (Public)
- Security Groups
- EC2 Instance (Loads up a simple html template)
- S3 bucket to save infrastructure state
- Additional EBS volume
- Multiple AZ arch

Create keys on your local machine:

1. run ```ssh-keygen``` in project directory >> filename : terrakey

This template creates an Amazon Linux system; user is **ec2-user**

To run this:
1. ``` Terraform init ```
2. ``` Terraform apply ```
