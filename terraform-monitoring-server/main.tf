terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.5"
    }
  }
  required_version = ">= 1.8"
  #### enable remote TF state
  backend "s3" {
    bucket = "terraform-state-s3-sergei" # please use your bucket name!!!
    key    = "monitoring-docker/tf-state.tfstate"       # Path to the state file in the bucket
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}