# Resource Group
resource "azurerm_resource_group" "main" {
  name     = "my-aks-rg"
  location = "East US"
}

# AKS Cluster
resource "azurerm_kubernetes_cluster" "main" {
  name                = "my-aks-cluster"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = "myakscluster"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "standard_d2ps_v5"
  }

  identity {
    type = "SystemAssigned"
  }
}

# Helm Release for Web Application
resource "helm_release" "webapp" {
  name       = "webapp"
  chart      = "../helm-charts"  
  namespace  = "default"

  set {
    name  = "frontend.image.repository"
    value = var.frontend_image_repository
  }

  set {
    name  = "frontend.image.tag"
    value = var.frontend_image_tag
  }

  set {
    name  = "backend.image.repository"
    value = var.backend_image_repository
  }

  set {
    name  = "backend.image.tag"
    value = var.backend_image_tag
  }

  set {
    name  = "mongodb.auth.rootPassword"
    value = var.mongodb_root_password
  }
}