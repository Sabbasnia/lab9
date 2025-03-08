Here is your properly formatted **Markdown (MD) document** without unnecessary icons:

```md
# 4640-AWS EC2 Setup Using Packer, Ansible, and Terraform
**Sina Abbasnia A01377364**  
**Tristan Torress A01331949**  

---

## Prerequisites  
Before following this tutorial, ensure you have installed the following:  

1. **Packer**  
2. **Terraform**  
3. **AWS CLI**  
4. **Ansible**  

Additionally, make sure your **AWS CLI** is properly configured. You should use the **`acit4640_admin`** profile.  
You can verify your AWS CLI configuration using:  

```bash
aws configure list
```

---

## Steps to Set Up  

### 1. Initialize Packer  
Navigate to the `packer/` directory and run:  

```bash
packer init .
```

### 2. Validate Packer Configuration  
Run the following command to validate the Packer template:  

```bash
packer validate .
```

**Note:** Use `.` instead of specifying a file because we are using a variable script for `ansible-web.pkr.hcl`.  
If you validate with the filename, it will return errors.

### 3. Build the AMI with Packer  
Once validation is successful, build the AMI:  

```bash
packer build .
```

After the build completes, verify your AMI in AWS:  

![image](https://github.com/user-attachments/assets/19209487-689f-4a7a-b228-48db363d3ebe)

---

## Ensure SSH Key-Pair is Set Up in Terraform  
Before proceeding with Terraform, ensure you have created the AWS key-pair in your Terraform directory.  

**Important:** If you have already imported the `aws-4640` key-pair, you must first delete it before moving forward.  
Run the following script before proceeding:  

```bash
./scripts/delete_lab_key
```

---

## Initialize and Apply Terraform Configuration  

### 1. Initialize Terraform  
Run the following command to initialize Terraform and install required plugins:  

```bash
terraform init
```

### 2. Validate Terraform Configuration  
To check for any syntax errors, run:  

```bash
terraform validate
```

### 3. Plan the Terraform Deployment  
Generate an execution plan with:  

```bash
terraform plan
```

### 4. Apply Terraform to Create AWS Infrastructure  
Run the following command to create the AWS infrastructure:  

```bash
terraform apply 
```

Once this completes, verify your AWS EC2 instances in the AWS Console:  

![image](https://github.com/user-attachments/assets/f6308727-bd87-419f-9de9-8b5be73c1e1d)

---

## Final Verification  
1. Confirm the AMI exists in the AWS **EC2 AMI section**.  
2. Confirm the instance is running in the AWS **EC2 Instances section**.  




