#This is the file where we will create EC2 instances
# This are the Variables for EC2 Instnaces
variable "ami-id" {}
variable "instance-type-for-Jenkins" {}

variable "subnet-id-Jenkins" {}
variable "security-group-Jenkins" {}
variable "key-pair" {}
variable "user-data-jenkins" {}

resource "aws_instance" "Jenkins-ec2-instance" {
  ami =var.ami-id
  instance_type = var.instance-type-for-Jenkins
  key_name = var.key-pair
  subnet_id = var.subnet-id-Jenkins
  vpc_security_group_ids = [var.security-group-Jenkins]
  associate_public_ip_address = true
  user_data = var.user-data-jenkins
  tags = {
    Name = "Jenkins-Master"
  }
}






