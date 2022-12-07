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
  default     = ""
}
variable "env_auth" {
  type        = bool
  description = "Enable env auth. Default: false"
  default     = false
}
variable "region" {
  type        = string
  description = "Region of the Bucket from Storage provider"
  default     = ""

}
variable "access_key_id" {
  type        = string
  description = "Access key of the Storage Provider "
  default     = ""
  
}

variable "secret_access_key" {
  type        = string
  description = "Secret key of the Storage Provider"
    default     = ""
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

variable "src_provider" {
  type        = string
  description = "Source storage provider for copying files"
  default     = ""
  
}
variable "dest_provider" {
  type        = string
  description = "Destination storage provider for copying files"
  default     = ""
}

variable "src_bucket" {
  type        = string
  description = "Type of action with rclone utility create / copy / dry-run"  
  default     = ""
}
variable "dest_bucket" {
  type        = string
  description = "Type of action with rclone utility create / copy / dry-run"  
  default     = ""
}

variable "file_name" {
  type        = string
  description = "File to be copied from source to destination"  
  default     = ""
}
