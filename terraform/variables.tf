variable "frontend_image_repository" {
  description = "Repository for frontend image"
  type        = string
  default     = "origenai/cloud-engineer-test-sample-app-rontend"
}

variable "frontend_image_tag" {
  description = "Tag for frontend image"
  type        = string
  default     = "1.0.0"
}

variable "backend_image_repository" {
  description = "Repository for backend image"
  type        = string
  default     = "origenai/cloud-engineer-test-sample-app-backend"
}

variable "backend_image_tag" {
  description = "Tag for backend image"
  type        = string
  default     = "1.0.0"
}

variable "mongodb_root_password" {
  description = "Root password for MongoDB"
  type        = string
  sensitive   = true
}