# This is Security Groups for EC2 Instances 
variable "vpc-id" {}

# Output of Jenkins-SG
output "Jenkins-SG" {
  value = aws_security_group.Jenkins-SG.id
}
# Secuirty group for Jenkins-Instnace
resource "aws_security_group" "Jenkins-SG" {
  name = "Jenkins-Security-Group"
  description = "This is Jenkins-Security-Group to allow PORT 8080"
  vpc_id = var.vpc-id
    ingress {
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allows traffic to port 8080"
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allows SSH from anywhere"
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Jenkins-SG"
  }
}
# Output of Kubernetes-Master
output "Kubernetes-Master" {
  value = aws_security_group.Kubernetes-Master-SG.id
}
# This Secuirty-Group is for Kubernetes-Master Instance
resource "aws_security_group" "Kubernetes-Master-SG" {
  name = "Kubernetes-Master-SG"
  vpc_id = var.vpc-id
  description = "This is Secuirty Group to Allow traffic from 2 Kubernetes-Slave Agenets but for now we will allow it from anywhere"
  ingress {
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allows SSH from anywhere"
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
# Output of Kubernetes-Slave
output "Kubernetes-Slave" {
  value = aws_security_group.Kubernetes-Slave-SG.id
}
# This Secuirty-Group is for Kubernetes-Slave Instance
resource "aws_security_group" "Kubernetes-Slave-SG" {
  name = "Kubernetes-Slave-SG"
  vpc_id = var.vpc-id
  description = "This is Security Group to allow traffic to all the port as there will be Node-Port configured with these to serve application"
  ingress {
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allows SSH from anywhere"
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
