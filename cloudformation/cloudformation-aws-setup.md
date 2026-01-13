Documentation to setup an EC2 instance with cloudformation in AWS  
Understand CloudFormation Basics  
   - CloudFormation allows you to define AWS infrastructure as code using YAML or JSON.  
   - Resources like EC2 instances, S3 buckets, security groups, etc., can be created and managed automatically.  
  
Steps to create an EC2 instance with Cloudformation template via console  
1. Sign in to console and navigate to Cloudformation
2. Choose Create stack
3. In Choose a template, choose upload a template file and upload the yaml file
4. In the Stack name box, type a name for the stack.
5. In Parameters, type the following, and then choose Next.  
--For InstanceCount, type the number of instances you want to launch.  
--For InstanceType, type the instance type you want to launch.  
--For KeyPairName, type the instance key pair name.  
--For OperatingSystem box, type preferred OS.  
--For SSHLocation, type the IP address range to use for connecting to the instance with SSH or RDP (or leave the default of 0.0.0.0/0).  
--For TagKey, type the instance tag key CodeDeploy will use to identify the instances during deployment (or leave the default of Name).  
--For TagValue, type the instance tag value CodeDeploy will use to identify the instances during deployment (or leave the default of CodeDeployDemo).  
6. Choose Next. On the Review page, in Capabilities, select the I acknowledge that CloudFormation might create IAM resources box, and then choose Create.  
After CloudFormation has created the stack and launched the Amazon EC2 instances, in the CloudFormation console, CREATE_COMPLETE will be displayed in the S>  
  
Steps to create an EC2 instance with Cloudformation template via AWS CLI  
1. Launch an EC2 instance and connect with terminal using key or perform on local terminal.
2. If on local terminal, install AWS CLI.
3. Create a file named as ec2-template.yaml which is the EC2 template
4. Use CloudFormation template in a call to the create-stack command. This stack will launch a new Amazon EC2 instance with the CodeDeploy agent installed.
To launch an Amazon EC2 instance:  
   aws cloudformation create-stack \  
    --stack-name my-ubuntu-ec2-stack \  
    --template-body file://ec2-template.yaml \
    --parameters ParameterKey=KeyName,ParameterValue=your-key-name \
    --capabilities CAPABILITY_NAMED_IAM
5. Check the status -  aws cloudformation describe-stacks \  
    --stack-name my-ubuntu-ec2-stack \
    --query "Stacks[0].StackStatus"
6. Getting the ip address - aws ec2 describe-instances \  
    --filters "Name=tag:aws:cloudformation:stack-name,Values=my-ubuntu-ec2-stack" \
    --query "Reservations[*].Instances[*].PublicIpAddress" \
    --output text  
7. Connect with that instance using key for testing.
