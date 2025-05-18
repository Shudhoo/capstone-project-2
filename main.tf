# All the modules will be call here to provision the whole infrastructure as these modular approcah helps to increase redability and reusesability of the code

module "vpc" {
  source = "./networking"
  vpc-cidr = var.vpc_cidr
  subnet-cidr = var.subnet_idr
}

module "security-group" {
  source = "./security"
  vpc-id = module.vpc.vpc-id
}

module "jenkins-ec2" {
  source = "./Jenkins-ec2"
  instance-type-for-Jenkins = var.instance_type_jenkins
  subnet-id-Jenkins = module.vpc.subnet-output
  security-group-Jenkins = module.security-group.Jenkins-SG
  key-pair = module.aws-key-pair.aws-key-pair-output
  ami-id = var.ami_id
}

module "kubernetes-master" {
  source = "./kubernetes-master-ec2"
  ami-id = var.ami_id
  key-pair = module.aws-key-pair.aws-key-pair-output
  instance-type-for-k8s-master = var.instance_type_k8s_master
  security-group = module.security-group.Kubernetes-Master
  subnet-id = module.vpc.subnet-output
}

module "kubernetes-slave" {
  source = "./kubernetes-slave-ec2s"
  ami-id = var.ami_id
  key-pair = module.aws-key-pair.aws-key-pair-output
  instance-type-for-k8s-slave = var.instance_type_k8s_slave
  subnet-id = module.vpc.subnet-output
  security-group = module.security-group.Kubernetes-Slave
}

module "aws-key-pair" {
  source = "./key-pair"
  aws-key-pairs = var.key_pair
}