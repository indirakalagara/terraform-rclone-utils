variable "name" {
  type        = string
  description = "Type of the provider"
  
}

variable "type" {
  type        = string
  description = "Type of the provider"
  default     = "s3"
}

variable "storage_provider" {
  type        = string
  description = "Type of cloud provider for storage"
 
}
variable "env_auth" {
  type        = bool
  description = "Enable env auth. Default: false"
  default     = false
}
variable "region" {
  type        = string
  description = "Region of the Bucket from Storage provider "

}
variable "access_key_id" {
  type        = string
  description = "Access key of the Storage Provider "
  
}

variable "secret_access_key" {
  type        = string
  description = "Secret key of the Storage Provider"

}
variable "endpoint" {
  type        = string
  description = "Type of the provider"
  default     = ""
}

variable "rcaction" {
  type        = string
  description = "Type of action with rclone utility create / copy / dry-run"
  default     = "create"
}
