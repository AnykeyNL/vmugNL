data "oci_identity_availability_domains" "ads" {
  compartment_id = var.tenancyOCID
}

data "oci_identity_compartments" "myCompartment" {
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaahe24eabqyiylme5zi2gpernbx7blo5vs3hkntxvlfvtzv2ciix5q"
  name           = var.vmFolder
  state          = "ACTIVE"
}

data "oci_core_images" "templateImage" {
  compartment_id = data.oci_identity_compartments.myCompartment.id
  display_name = var.baseTemplate
  state = "AVAILABLE"
}

