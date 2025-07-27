terraform {
  backend "s3" {
    bucket         = "github-oidc-terraform-tfstate"
    key            = "github-oidc-terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
  }
}