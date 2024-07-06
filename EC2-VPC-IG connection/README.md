Creating an Access Key and Secret Key on AWS:

Sign in to the AWS Management Console. Go to the IAM service. Select "Users" from the left sidebar and choose the IAM user for whom you want to create the access key. In the "Security credentials" tab, click "Create access key" button. Copy the generated access key ID and secret access key (these are used for programmatic access).

Finding an Ubuntu AMI: Navigate to the EC2 service in the AWS Management Console. Click "Launch Instance" and search for the desired Ubuntu version in the AMI marketplace. Note the AMI ID for the Ubuntu version you want to use.

Data Block for aws_ami:

The data "aws_ami" block in Terraform retrieves information about an AMI (Amazon Machine Image) based on specified filters. Filter for AMI Name and Virtualization Type:


Running Terraform

Open a terminal or command prompt in the directory where your Terraform configuration file is located. Initialize the Terraform configuration by running: terraform init Plan the changes to be applied with: terraform plan Apply the changes to create resources with: terraform apply

Documentation Links


https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet.html

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway.html

https://registry.terraform.io/modules/terraform-aws-modules/ec2-instance/aws/latest


















