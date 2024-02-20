Bid Wheels<h1>Bid Wheels( Shipping Bid System )</h1>

![img](https://github.com/Parthvaghela8/BidWheels/blob/main/image.png)

link : https://dbdiagram.io/d/65d43a8aac844320ae892cab

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

## Workflow Overview
 
This GitHub Actions workflow automates database migrations using Flyway, enabling you to effortlessly manage database schema changes.
 
## Workflow Script
 
```yaml
name: flyway
 
on:
  push:
    branches:
      - main
 
jobs:
  deploy:
    runs-on: ubuntu-latest
 
    env:
      FLYWAY_USER: ${{ secrets.DB_BUILD_USERNAME }}
      FLYWAY_PASSWORD: ${{ secrets.DB_BUILD_PASSWORD }}
      FLYWAY_URL: ${{ secrets.DB_BUILD_URL }}
      FLYWAY_CLEAN_DISABLED: false
      FLYWAY_LOCATIONS: "filesystem:./migrations/"
      FLYWAY_CONFIG_FILES: "filesystem:./conf/flyway.toml"
 
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
      - name: Setup Flyway CLI
        run: |
          sudo apt update
          sudo apt install -y default-jre
          wget -qO- https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/7.9.1/flyway-commandline-7.9.1-linux-x64.tar.gz | tar xvz
          sudo ln -s $(pwd)/flyway-7.9.1/flyway /usr/local/bin/flyway
 
      - name: Flyway Repair
        run: |
          flyway repair

      - name: Flyway Migrate
        run: |
          flyway migrate \
             -url="${FLYWAY_URL}" \
            -user="${FLYWAY_USER}" \
            -password="${FLYWAY_PASSWORD}" \
            -configFiles="${FLYWAY_CONFIG_FILES}"
```
 
## Workflow Steps
 
1. **Checkout code:** This step checks out the repository code.
 
2. **Setup Flyway CLI:** Installs the required dependencies and sets up Flyway CLI.
 
3. **Create Secrets in GitHub:**
   - Navigate to your GitHub repository.
   - Go to the "Settings" tab.
   - In the left sidebar, click on "Secrets."
   - Click on "New repository secret" and add the following secrets:
      - `DB_BUILD_USERNAME`: Your database username.
      - `DB_BUILD_PASSWORD`: Your database password.
      - `DB_BUILD_URL`: Your database URL.
 
4. **Flyway Repair:** Repairs the metadata table if necessary.
 
5. **Flyway Migrate:** Executes database migrations using Flyway.
 
## Conclusion
 
You now have a comprehensive setup covering KindnessKettle, AWS CloudFormation deployment, Flyway installation, and GitHub Actions for automating database migrations, with the added step of creating necessary secrets in GitHub Actions for secure storage of sensitive information.

