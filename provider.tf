terraform {
  backend "s3" {
    bucket = "467.devops.candidate.exam"
    key    = "aneesh.pattamatta"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = "ap-south-1"
}
