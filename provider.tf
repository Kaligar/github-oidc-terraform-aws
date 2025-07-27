terraform {
  backend "s3" {
    bucket = "github-oidc-terraform-aws-tf2"       # Cambia esto por el nombre real de tu bucket S3
    key    = "terraform.tfstate"  # Ruta donde se guardará el archivo tfstate
    region = "us-east-2"                     # Cambia por la región de tu bucket
    
  }
}
