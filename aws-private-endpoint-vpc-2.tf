
// Creates a VPC Private Endpoint in the given VPC along with the Elastic Network Interfaces in the given subnets
resource "aws_vpc_endpoint" "private_endpoint_02" {
  provider           = aws.vpc-02
  vpc_id             = aws_vpc.vpc-02.id
  service_name       = mongodbatlas_privatelink_endpoint.private_endpoint_service.endpoint_service_name
  vpc_endpoint_type  = "Interface"
  subnet_ids         = [aws_subnet.vpc-02-az1.id, aws_subnet.vpc-02-az2.id]
  security_group_ids = [aws_security_group.vpc-02_default.id]

  tags = {
    terraform = "true"
    Name = "private-endpoint-02"
  }
}
