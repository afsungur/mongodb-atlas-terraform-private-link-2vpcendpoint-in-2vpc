//Create Primary VPC
resource "aws_vpc" "vpc-01" {
  provider             = aws.vpc-01
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  
  tags = {
    terraform = "true"
    Name = "vpc-01"
  }
}

//Create IGW
resource "aws_internet_gateway" "vpc-01" {
  provider = aws.vpc-01
  vpc_id   = aws_vpc.vpc-01.id
}

//Route Table Configuration
resource "aws_route" "vpc-01-internet_access" {
  provider               = aws.vpc-01
  route_table_id         = aws_vpc.vpc-01.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc-01.id
}

//Subnet-1
resource "aws_subnet" "vpc-01-az1" {
  provider                = aws.vpc-01
  vpc_id                  = aws_vpc.vpc-01.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${var.aws_region}a"

  tags = {
    terraform = "true"
    Name = "vpc-01-subnet-01"
  }
}

//Subnet-2
resource "aws_subnet" "vpc-01-az2" {
  provider                = aws.vpc-01
  vpc_id                  = aws_vpc.vpc-01.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "${var.aws_region}b"

  tags = {
    terraform = "true"
    Name = "vpc-01-subnet-02"
  }
}

// Security Group Settings
resource "aws_security_group" "vpc-01_default" {
  provider    = aws.vpc-01
  name_prefix = "default-"
  description = "Default security group for all instances in ${aws_vpc.vpc-01.id}"
  vpc_id      = aws_vpc.vpc-01.id
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
