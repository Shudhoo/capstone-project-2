variable "ami-id" {}
variable "subnet-id" {}
variable "security-group" {}
variable "instance-type-for-k8s-master" {}
variable "key-pair" {}

resource "aws_instance" "K8s-master-ec2-instance" {
  ami = var.ami-id
  instance_type = var.instance-type-for-k8s-master
  key_name = var.key-pair
  subnet_id = var.subnet-id
  vpc_security_group_ids = [var.security-group]
  associate_public_ip_address = true
}