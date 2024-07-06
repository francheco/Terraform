

provider "aws" {
  region = "us-west-1"  # Specify your desired region here
}

# Data source for retrieving the latest Ubuntu AMI
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  owners = ["099720109477"]  # Canonical account ID for Ubuntu AMIs
}

# Data source for retrieving the latest MongoDB AMI
data "aws_ami" "mongodb" {
  most_recent = true
  filter {
    name   = "name"
    values = ["mongo-*"]
  }
  owners = ["XXXXXXXXXXXX"]  # Replace with the appropriate owner ID for MongoDB AMIs
}

# Create VPCs with unique CIDR blocks
resource "aws_vpc" "ubuntu_vpc" {
  cidr_block = "10.0.0.0/16"  # Update with your desired CIDR block for Ubuntu instances
}

resource "aws_vpc" "mongodb_vpc" {
  cidr_block = "10.1.0.0/16"  # Update with your desired CIDR block for MongoDB instances
}

# Create Internet Gateways and attach them to respective VPCs
resource "aws_internet_gateway" "ubuntu_igw" {
  vpc_id = aws_vpc.ubuntu_vpc.id
}

resource "aws_internet_gateway" "mongodb_igw" {
  vpc_id = aws_vpc.mongodb_vpc.id
}


# Create Ubuntu instances and MongoDB instances in respective VPCs with private IP addresses
resource "aws_instance" "ubuntu_instance1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_vpc.ubuntu_vpc.default_security_group_id]
  subnet_id = aws_subnet.ubuntu_subnet1.id
  private_ip = "10.0.0.10"  # Assign a specific private IP address
}

resource "aws_instance" "ubuntu_instance2" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_vpc.ubuntu_vpc.default_security_group_id]
  subnet_id = aws_subnet.ubuntu_subnet2.id
  private_ip = "10.0.0.20"  # Assign a different private IP address
}

resource "aws_instance" "mongodb_instance1" {
  ami           = data.aws_ami.mongodb.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_vpc.mongodb_vpc.default_security_group_id]
  subnet_id = aws_subnet.mongodb_subnet1.id
  private_ip = "10.1.0.10"  # Assign a specific private IP address
}

resource "aws_instance" "mongodb_instance2" {
  ami           = data.aws_ami.mongodb.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_vpc.mongodb_vpc.default_security_group_id]
  subnet_id = aws_subnet.mongodb_subnet2.id
  private_ip = "10.1.0.20"  # Assign a different private IP address
}
