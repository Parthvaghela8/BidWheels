Bid Wheels<h1>Bid Wheels( Shipping Bid System )</h1>

![img](https://github.com/Parthvaghela8/BidWheels/blob/main/ERD.png)

<h2>Technology Used : </h2>

   <h3> 1. Terraform:   </h3>
            Used for RDS instance creation from Infrastructure as a Code.
    
   <h3> 2. FlyWay:   </h3>
            Used For The Migration of The Database

    
   <h3> 3. GitHub Actions:   </h3>
            Used For The CICD Pipeline.


<h2>Terraform</h2>

# Terraform Git Repository

This repository contains Terraform code to provision and manage infrastructure on [your cloud provider]. It simplifies the deployment process and ensures infrastructure as code principles are followed.

## Getting Started

These instructions will help you get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Before you begin, ensure you have the following tools installed:

- [Terraform](https://www.terraform.io/downloads.html)



<h2>1.  Initialize Terraform:</h2>
Run the following command to initialize Terraform:

bash
Copy code
terraform init
Create a main.tf File:
Create a main.tf file in your project directory and add the following content:

hcl
Copy code
# main.tf

provider "aws" {
  region = "us-east-1" # Update with your desired region
}

resource "aws_instance" "example_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Update with your desired AMI
  instance_type = "t2.micro"             # Update with your desired instance type

  tags = {
    Name = "example-instance"
  }
}
Adjust the region, ami, and instance_type based on your preferences. The tags block is optional but can be useful for identifying your instances.

<h2>2.  Plan and Apply:</h2>
Run the following commands to plan and apply the changes:

bash
Copy code
terraform plan
terraform apply
Confirm the changes by typing yes when prompted.

<h2>3. Verify Instance Creation:</h2>
Once the apply is complete, verify that your instance is created in the AWS Console or by using the AWS CLI.


Remember to replace the placeholder values in the Terraform configuration with your actual preferences, and ensure that your AWS credentials are configured on your machine.
 Additionally, always be cautious when working with infrastructure provisioning, especially in production environments.


#Flyway
Flyway is a tool that allows you to increase the reliability of deployments by versioning your database. It places changes to your database in version control so that it can be repeated in a new environment. This allows you to repeat deployments in different environments without being concerned about
Create Database:
Ensure that you have set up and configured your target database.


<h3>1. Create Database:</h3>
Ensure that you have set up and configured your target database.

<h3>2. Download and Install Flyway:</h3>
Download the Flyway Command-Line Interface (CLI) from the official Flyway downloads page. Follow the installation instructions for your operating system.

<h3>3.  Set Up Database Connection:</h3>
Create a Flyway configuration file (e.g., flyway.conf) or provide configuration parameters via command-line options. Specify the database connection details such as URL, username, and password.
