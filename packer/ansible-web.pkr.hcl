packer {
  # Add necessary plugins for Ansible and AWS
  required_plugins {
    amazon = {
      version = ">= 1.3"
      source  = "github.com/hashicorp/amazon"
    }
    ansible = {
      version = ">= 1.0"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  # Use Ubuntu 24.04 as the source image
  ami_name      = "web-nginx-aws"
  instance_type = "t2.micro"
  region        = "us-west-2"

  source_ami_filter {
    filters = {
      name                = "ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20250115"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }

  ssh_username = var.ssh_username
}

build {
  name = "packer-ansible-nginx"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

  # Install Ansible inside the build image using a shell provisioner

  provisioner "ansible" {
    playbook_file = "../ansible/playbook.yml"
    user            = var.ssh_username
    extra_arguments = ["-e", "ANSIBLE_HOST_KEY_CHECKING=False"]
  }
}