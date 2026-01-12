Instructions to provision a VM in GCP using Ansible playbook  
Step 1: Create a GCP VM(control node)  
Create a ubuntu VM with configuration - Name:ansible-control, OS: Ubuntu 22.04, Machine type: e2.micro, Network: allow SSH  
  
Step 2: Connect to the VM  
Using this command, connect with control node: gcloud compute ssh ansible-control-vm --zone <zone_of_vm>  
  
Step 3: Install Ansible on Control Node  
sudo apt update  
sudo apt install -y ansible python3-pip  
pip3 install google-auth google-auth-httplib2 google-api-python-client  
Install gcp ansible  
ansible-galaxy collection install google.cloud  
  
Step 4: Authenticate GCP on Control Node  
Copy service account key to the VM  
Set environment variable: export GCP_SERVICE_ACCOUNT_FILE=/home/ubuntu/ansible-sa.json   
Or attach service account directly to VM  
  
Step 5: Create Ansible Playbook on Control Node  
nano gcp-vm.yml  
  
Step 6: Run ansible  
ansible-playbook gcp-vm.yml  
This runs ansible and creates vm  
  
Step 7: Verify  
Checkout the Compute Engine -> VM instances. A new VM is seen created by ansible.  
  
Step 8: Cleanup  
ansible-playbook gcp-vm.yml --extra-vars "state=absent"
