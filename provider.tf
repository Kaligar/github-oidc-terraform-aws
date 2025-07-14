terraform {
  backend "s3" {
    bucket         = "github-oidc-terraform-tfstate"
    key            = "github-oidc-terraform.tfstate"
    region         = "ca-central-1"
    encrypt        = true
  }
}
