//Create vpc-02 VPC
resource "aws_vpc" "vpc-02" {
  provider             = aws.vpc-02
  cidr_block           = "172.31.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    terraform = "true"
    Name = "vpc-02"
  }
}

//Create IGW
resource "aws_internet_gateway" "vpc-02" {
  provider = aws.vpc-02
  vpc_id   = aws_vpc.vpc-02.id
}

//Route Table Configuration
resource "aws_route" "vpc-02-internet_access" {
  provider               = aws.vpc-02
  route_table_id         = aws_vpc.vpc-02.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc-02.id
}

//Subnet-A
resource "aws_subnet" "vpc-02-az1" {
  provider                = aws.vpc-02
  vpc_id                  = aws_vpc.vpc-02.id
  cidr_block              = "172.31.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"

  tags = {
    terraform = "true"
    Name = "vpc-02-subnet-01"
  }
}

//Subnet-B
resource "aws_subnet" "vpc-02-az2" {
  provider                = aws.vpc-02
  vpc_id                  = aws_vpc.vpc-02.id
  cidr_block              = "172.31.2.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "${var.aws_region}b"

  tags = {
    terraform = "true"
    Name = "vpc-02-subnet-02"
  }
}

// Security Group Settings
resource "aws_security_group" "vpc-02_default" { 
  provider    = aws.vpc-02
  name_prefix = "default-"
  description = "Default security group for all instances in ${aws_vpc.vpc-02.id}"
  vpc_id      = aws_vpc.vpc-02.id
  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
