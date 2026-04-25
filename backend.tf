terraform {
  backend "s3" {
    bucket         = "terraform-state-jayendra"
    key            = "create-rg/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
  }
}