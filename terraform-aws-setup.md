Document to provision an ec2 instance using terraform on AWS  
There are two ways - by IAM USER, IAM ROLE  
If IAM user is chosen:  
Step 1: Install Terraform  
Download and install Terraform from the official website and verify the installation: terraform -version  
Step 2: Configure AWS CLI  
Configure AWS credentials using: aws configure  
Step 3: Create a terraform file which has the configuration of instance to be created  
nano main.tf
Step 4: Initialize Terraform  
Initialize the Terraform working directory:terraform init  
Step 5: Review Execution Plan  
Check what resources Terraform will create: terraform plan  
Step 6: Apply Configuration  
Create the EC2 instance: terraform apply  
Step 7: Cleanup Resources  
Destroy the created resources after verification: terraform destroy  
  
If IAM role is chosen:  
Step 1: Create IAM Role  
1. Go to IAM → Roles → Create role
2. Trusted entity: AWS service
3. Use case: EC2
4. Attach permissions policy like - AmazonEC2FullAccess  
Step 2: Create an EC2 instance  
1. Launch EC2 and configure  
AMI: Ubuntu  
Instance type: t3.micro  
Key pair: Choose a key or create one  
Security Group: Allow SSH (22) from your IP  
2. Attach IAM role to it  
Step 3: Connect to EC2 from Your Local Terminal  
From your local machine: ssh -i key.pem ec2-user@<EC2_PUBLIC_IP>  
Step 4: Install Terraform  
1. Update system - sudo apt update && sudo apt upgrade -y
2. Install dependencies - sudo apt install -y gnupg software-properties-common curl
3. Add HashiCorp repository - curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
4. echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
5. Install Terraform  
sudo apt update  
sudo apt install terraform -y  
6. Verify - terraform -version  
Step 6: Create Terraform Configuration
1. mkdir terraform-demo
2. cd terraform-demo
3. nano main.tf
Step 7: Run Terraform  
1. Initialize - terraform init
2. Plan - terraform plan 
3. Apply - terraform apply  
Step 8: Check if instance is ready according to configuration in file  
Step 9: Destroy Resources - terraform destroy
