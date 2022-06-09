terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = ">= 1.1.0"

}

provider "aws" {
  region = "us-west-2"
}

locals {
  bucket="terraform-state-files-bda"
  config_dir = "configs"

}
resource "aws_s3_bucket_object" "plugins" {
  bucket = local.bucket
  key = "plugins.zip"
  source = "./${local.config_dir}/plugins.zip"
}

resource "aws_s3_bucket_object" "requirements" {
  bucket = local.bucket
  key = "requirements.txt"
  source = "./${local.config_dir}/requirements.txt"
}