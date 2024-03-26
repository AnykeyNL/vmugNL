dashboard "Multicloud" {
  title = "All my VMs"

 text {
    value = "My multi cloud dashboard"
  }

  container {
  card {
    sql = <<-EOQ
        select count(*) as "VMware VMs" from vsphere.vsphere_vm
    EOQ
    width=3
  }

  card {
    sql = <<-EOQ
        select count(*) as "OCI VMs" from oci.oci_core_instance
    EOQ
    width=3
  }
  }

container {
chart {
  type = "donut"
  title = "VMware State"
  width = 3

  sql = <<-EOQ
    select
        count(*) as VMs, power
    from
        vsphere.vsphere_vm
    group by
        power
  EOQ
}

chart {
  type = "donut"
  title = "OCI State"
  width = 3

  sql = <<-EOQ
    select
        count(*) as VMs, lifecycle_state
    from
        oci.oci_core_instance
    group by
        lifecycle_state
  EOQ
}
}


}

