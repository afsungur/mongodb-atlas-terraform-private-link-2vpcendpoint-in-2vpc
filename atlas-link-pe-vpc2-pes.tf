// It links the Private Endpoint that was created in the AWS side VPC-02 with the Private Endpoint Service that was created in Atlas VPC
resource "mongodbatlas_privatelink_endpoint_service" "aws_pe_02_to_atlas_pes" {
  project_id          = mongodbatlas_privatelink_endpoint.private_endpoint_service.project_id
  private_link_id     = mongodbatlas_privatelink_endpoint.private_endpoint_service.private_link_id
  endpoint_service_id = aws_vpc_endpoint.private_endpoint_02.id
  provider_name       = "AWS"
}
