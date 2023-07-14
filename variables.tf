variable "atlas_project_id" {
  description = "Atlas Project ID"
  default = "5f4fab1a7469776c02865ebe"
}

variable "atlas_region" {
  default     = "ME_SOUTH_1"
  description = "Atlas Region"
}
variable "aws_region" {
  default     = "me-south-1"
  description = "AWS Region"
}

variable "atlas_vpc_cidr" {
  description = "Atlas CIDR"
  default = "192.168.240.0/21"
}

variable "linux_associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address to the EC2 instance"
  default     = true
}

variable "key_pair_name" {
  type  = string
  default = "fuat_me"
}