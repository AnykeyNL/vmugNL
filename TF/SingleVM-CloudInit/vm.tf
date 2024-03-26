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
  }

    extra_config = {
      "guestinfo.metadata"          = base64encode(file("${path.module}/metadata.yaml"))
      "guestinfo.metadata.encoding" = "base64"
      "guestinfo.userdata"          = base64encode(file("${path.module}/userdata.yaml"))
      "guestinfo.userdata.encoding" = "base64"
  }



}