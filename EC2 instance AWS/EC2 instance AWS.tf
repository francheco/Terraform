

# Configure the AWS provider with region and access keys
provider "aws" {
  region     = "us-east-1"     # Specify the AWS region
  access_key = "YOUR_ACCESS_KEY_HERE"  # Set your AWS access key
  secret_key = "YOUR_SECRET_KEY_HERE"  # Set your AWS secret key
}

# Define the Ubuntu EC2 instance resource with AMI, instance type, and tags
resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu.id  # Use the Ubuntu AMI ID from the data source
  instance_type = "t2.micro"             # Specify the instance type
  
  tags = {                               # Define tags for the instance
    Name        = "ubuntu"               # Specify the Name tag
    Description = "This is my Ubuntu server"  # Add a description for the instance
  }
}

# Retrieve the latest Ubuntu AMI ID
data "aws_ami" "ubuntu" {
  most_recent = true                 # Retrieve the most recent AMI
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]  # Filter for Ubuntu 20.04 AMI
  }
  
  filter {
    name   = "virtualization-type"
    values = ["hvm"]                 # Filter for hardware virtual machine (HVM)
  }

  owners = ["099720109477"]          # Specify the AMI owner (Canonical)
}
