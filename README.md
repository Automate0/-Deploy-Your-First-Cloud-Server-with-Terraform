# -Deploy-Your-First-Cloud-Server-with-Terraform
Provision a live AWS EC2 instance and security group using Terraform — written to learn the fundamentals of Infrastructure as Code (IaC).
📖 Overview

This project uses Terraform to define, deploy, and tear down a cloud server on AWS — entirely through code instead of clicking around the AWS Console. It covers the full IaC workflow: writing configuration, initializing the workspace, planning changes, applying infrastructure, and destroying it cleanly.

The instance launches with the latest Ubuntu 24.04 LTS AMI (auto-discovered via a Terraform data source) and is secured by a custom security group that allows inbound HTTP traffic.

🏗️ Architecture

                 ┌─────────────────────────┐
                 │   aws_security_group     │
                 │   "web"                  │
                 │   • Inbound: HTTP (80)   │
                 │   • Outbound: All        │
                 └────────────┬─────────────┘
                              │
                              ▼
                 ┌─────────────────────────┐
                 │   aws_instance           │
                 │   "app_server"           │
                 │   • Ubuntu 24.04 (AMI)   │
                 │   • t2.micro             │
                 └─────────────────────────┘

🛠️ Tools & Technologies

ToolPurposeTerraformInfrastructure as Code engineAWS CLI v2Authenticate and verify AWS credentialsAWS EC2Compute instance (t2.micro)AWS Security GroupsNetwork access controlIAMCredentials and permissions

📂 Project Structure

terraform-server/
├── terraform.tf        # Terraform settings & required provider versions
├── main.tf              # Provider config, AMI data source, security group, EC2 instance
├── variables.tf          # Input variables (region, instance name)
├── outputs.tf             # Output values (public IP, instance ID)
└── .terraform.lock.hcl     # Provider dependency lock file

⚙️ What It Deploys


data.aws_ami.ubuntu — Dynamically looks up the most recent official Ubuntu 24.04 LTS AMI, so the image stays current without hardcoding an ID.
aws_security_group.web — Allows inbound HTTP (port 80) from anywhere and unrestricted outbound traffic.
aws_instance.app_server — A t2.micro EC2 instance using the discovered AMI, attached to the security group above.


🔧 Prerequisites


Terraform >= 1.2
AWS CLI v2
An AWS account with credentials configured (aws configure)


▶️ Usage


Clone the repo


bash   git clone https://github.com/Automate0/<repo-name>.git
   cd <repo-name>


Initialize Terraform


bash   terraform init


Preview the execution plan


bash   terraform plan


Apply the configuration


bash   terraform apply


Grab the outputs


bash   terraform output

Returns the instance's public IP and instance ID.


Tear everything down


bash   terraform destroy

📤 Outputs

OutputDescriptioninstance_public_ipPublic IPv4 address of the EC2 instanceinstance_idThe EC2 instance ID

🧠 Key Concepts Learned


Installing and configuring Terraform and the AWS CLI
Authenticating Terraform against AWS using aws sts get-caller-identity
Structuring a Terraform project (terraform block, providers, variables, outputs)
Using data sources to reference existing resources (e.g., AMI lookup) instead of hardcoding values
Reading terraform plan output to understand proposed changes
Making in-place updates to infrastructure and observing how Terraform tracks state
Safely destroying infrastructure with terraform destroy


🔭 Next Steps


Build a full CI/CD pipeline around this Terraform configuration (e.g., GitHub Actions for plan/apply)
Move state to a remote backend (e.g., S3 + DynamoDB) for team collaboration
Parameterize further with terraform.tfvars and multiple environments (dev/staging/prod)


👤 Author

Adan Playil
