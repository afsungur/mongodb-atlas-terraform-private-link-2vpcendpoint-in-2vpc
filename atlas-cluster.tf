resource "mongodbatlas_cluster" "cluster-test" {
  project_id   = var.atlas_project_id
  name         = "cluster-test"
  cluster_type = "REPLICASET"
  replication_specs {
    num_shards = 1
    regions_config {
      region_name     = "ME_SOUTH_1"
      electable_nodes = 3
      priority        = 7
      read_only_nodes = 0
    }
  }
  cloud_backup = true
  auto_scaling_disk_gb_enabled = true
  mongo_db_major_version       = "6.0"

  # Provider Settings "block"
  provider_name               = "AWS"
  provider_instance_size_name = "M10"
}