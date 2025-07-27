terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

variable "cloudfare_email" {}
variable "cloudfare_token" {}

variable "domain_name" {
  default = "230400110.lindavdesign.com"
}

variable "email_admin" {
  default = "23040011@utculiacan.edu.mx"
}

variable "ssh_private_key" {
  description = "SSH private key content"
  type        = string
  sensitive   = true
}

resource "aws_instance" "example" {
  ami                    = "ami-02da2f5b47450f5a8" # Debian 12 us-east-2
  instance_type          = "t2.micro"
  key_name               = "terraform"
  vpc_security_group_ids = ["sg-0ad10b5c714b930c3"]

  
  #provisioner "remote-exec" {
    #inline = [
      #"echo 'Esperando SSH...'",
     # "sudo apt update -y"
    #]

    #connection {
      #type        = "ssh"
      #user        = "admin"
     # private_key = var.ssh_private_key
    #  host        = self.public_ip
   # }
  #}
 
#  provisioner "local-exec" {
#    command = "ansible-playbook -i \"${self.public_ip},\" --private-key ~/.ssh/id_rsa --extra-vars \"odoo_domain=${var.domain_name} odoo_email=${var.email_admin} public_ip_record=${self.public_ip} cloudfare_email=${var.cloudfare_email} cloudfare_token=${var.cloudfare_token}\" ansible/aws/aws-odoo.yml"
#  }
}


output "example_ip" {
  value = aws_instance.example.public_ip
}

