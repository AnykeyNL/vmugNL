resource "vsphere_virtual_machine" "vm" {
  name             = var.vmName
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_resource_pool.pool.id
  folder           = "Richard"

  num_cpus = var.vmCPU
  memory   = var.vmMemory
  guest_id = data.vsphere_virtual_machine.template.guest_id

  network_interface {
    network_id = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label = "disk0"
    size  = data.vsphere_virtual_machine.template.disks.0.size
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = var.vmName
        domain    = "local"
      }

      network_interface {
        ipv4_address = var.vmIP
        ipv4_netmask = var.vmNetmask
      }

      ipv4_gateway = var.vmGateway
      dns_server_list = [var.vmDNS]
    }
  }

    extra_config = {
    "guestinfo.cloud-init.config.data" = base64encode(file("${path.module}/cloud-init.yaml"))
    "guestinfo.cloud-init.config.data.encoding" = "base64"
  }
}