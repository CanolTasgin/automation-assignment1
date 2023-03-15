resource "azurerm_public_ip" "lb" { # public IP address for the load balancer
  name                = "n01510487-lb-public-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  tags                = var.tags
}

resource "azurerm_lb" "lb" { # load balancer
  name                = "n01510487-basic-lb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Basic"

  frontend_ip_configuration { # associate the public IP address with the load balancer
    name                 = "public-ip"
    public_ip_address_id = azurerm_public_ip.lb.id
  }

  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "backend_pool" { # create a backend pool to distribute traffic to
  loadbalancer_id = azurerm_lb.lb.id
  name            = "n01510487-backend-pool"
}

resource "azurerm_lb_probe" "probe" { # create probes to determine the health of backend endpoints
  loadbalancer_id = azurerm_lb.lb.id
  name            = "n01510487-probe"
  port            = var.probe_port
}

resource "azurerm_lb_rule" "rule" { # create a load balancing rule to direct traffic to the backend pool
  loadbalancer_id                = azurerm_lb.lb.id
  name                           = "n01510487-rule"
  protocol                       = "Tcp"
  frontend_port                  = var.frontend_port
  backend_port                   = var.backend_port
  frontend_ip_configuration_name = "public-ip"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backend_pool.id]
  probe_id                       = azurerm_lb_probe.probe.id
}

resource "azurerm_network_interface_backend_address_pool_association" "nic_association" { # associate the backend pool with the network interfaces
  count                   = length(var.network_interface_ids)
  network_interface_id    = var.network_interface_ids[count.index]
  ip_configuration_name   = "primary"
  backend_address_pool_id = azurerm_lb_backend_address_pool.backend_pool.id
}
