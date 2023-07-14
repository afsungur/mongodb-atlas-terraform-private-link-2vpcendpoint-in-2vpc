// It creates the actual Private Endpoint Service in the Atlas VPC 
resource "mongodbatlas_privatelink_endpoint" "private_endpoint_service" {
  project_id    = var.atlas_project_id
  provider_name = "AWS"
  region        = var.aws_region
}