variable "access_key" {}
variable "secret_key" {}
variable "region" {
   default = "ap-northeast-1"
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type 	      = string
  default     = "Test_EC2_from_Terraform"
}

variable "ami_id" {
  description = "Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-05-16"
  type        = string 
  default     = "ami-0d52744d6551d851e"
}


