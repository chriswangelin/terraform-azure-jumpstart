terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

resource random_pet resource_prefix { 
  length    = 2
  separator = ""
}

locals {
  name                    = coalesce(var.name, "${random_pet.resource_prefix.id}-vm")  
  nic_name_001            = "${local.name}-nic-001"
  pip_name_001            = "${local.name}-pip-001"
  ipconfig_name_001       = "ipconfig-001"
  os_disk_name            = "${local.name}-osdisk-001"

  # Split urn into its component pieces 
  source_image_publisher = split(":", var.urn)[0] 
  source_image_offer     = split(":", var.urn)[1]
  source_image_sku       = split(":", var.urn)[2]
  source_image_version   = split(":", var.urn)[3]

  # plan_publisher         = coalesce(var.plan_publisher, local.source_image_publisher)
  # plan_product           = coalesce(var.plan_product, local.source_image_offer)
  # plan_name              = coalesce(var.plan_name, local.source_image_sku)
}
