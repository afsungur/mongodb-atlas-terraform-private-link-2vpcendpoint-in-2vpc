
// Creates a VPC Private Endpoint in the given VPC along with the Elastic Network Interfaces in the given subnets
resource "aws_vpc_endpoint" "private_endpoint_01" {
  provider           = aws.vpc-01
  vpc_id             = aws_vpc.vpc-01.id
  service_name       = mongodbatlas_privatelink_endpoint.private_endpoint_service.endpoint_service_name
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [aws_subnet.vpc-01-az1.id, aws_subnet.vpc-01-az2.id]
  security_group_ids = [aws_security_group.vpc-01_default.id]

  tags = {
    terraform = "true"
    Name = "private-endpoint-01"
  }
}
