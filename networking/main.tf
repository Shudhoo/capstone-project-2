# This folder is for networking which means creating VPCs, Subnets, Internet-Gateways etc

# Creating a VPC for the Kubernetes Cluster and Jenkins-Server

# Vaiables 
variable "vpc-cidr" {}
variable "subnet-cidr" {}

output "vpc-id" {
  value = aws_vpc.project-vpc.id
}

# This is VPC
resource "aws_vpc" "project-vpc" {
  cidr_block = var.vpc-cidr
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "capstone-project-vpc"
  }
}

# This is Internet-Gateway
resource "aws_internet_gateway" "project-igw" {
  vpc_id = aws_vpc.project-vpc.id
  tags = {
    Name = "capstone-project-igw"
  }
}

# Output of Public Subnet 
output "subnet-output" {
  value = aws_subnet.project-subnet.id
}
# This is Public Subnet
resource "aws_subnet" "project-subnet" {
  vpc_id = aws_vpc.project-vpc.id
  cidr_block = var.subnet-cidr

  tags = {
    Name = "capstone-project-subnet-public"
  }
}

 # This is Route-Table for Public Subnet
resource "aws_route_table" "project-route-table" {
  vpc_id = aws_vpc.project-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project-igw.id
  }
  tags = {
    Name = "capstone-project-route-table"
  }
}

# This is Route-Table-Association 
resource "aws_route_table_association" "name" {
  subnet_id = aws_subnet.project-subnet.id
  route_table_id = aws_route_table.project-route-table.id
}

