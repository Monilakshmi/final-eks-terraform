
terraform {
required_providers {
aws = {
source = "hashicorp/aws"
version = "~> 4.0"
}
}
backend "s3" {
bucket = "lambda00"
key = "eks-setup/terraform.tfstate"
region = "ap-south-1" 
encrypt = true
access_key = "AKIA25ZNO55TQHXUXAEC"
secret_key = "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"
}
}

# Configure the AWS Provider
provider "aws" {
region = "ap-south-1"
access_key = "AKIA25ZNO55TQHXUXAEC"
secret_key = "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"
}
