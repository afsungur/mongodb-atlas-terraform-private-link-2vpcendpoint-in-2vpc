/*

# you can consider setting credentials with the environment variables
export MONGODB_ATLAS_PUBLIC_KEY="xxxx"
export MONGODB_ATLAS_PRIVATE_KEY="xxxx"
export AWS_ACCESS_KEY_ID="xxxx"
export AWS_SECRET_ACCESS_KEY="xxxx"
export AWS_SESSION_TOKEN="xxxx"
*/


provider "aws" {
  alias      = "vpc-01"
  region = var.aws_region
}

provider "aws" {
  alias      = "vpc-02"
  region = var.aws_region
}
