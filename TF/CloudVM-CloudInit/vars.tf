
variable tenancyOCID {default = "ocid1.tenancy.oc1..aaaaaaaahe24eabqyiylme5zi2gpernbx7blo5vs3hkntxvlfvtzv2ciix5q"}
variable subnet {default = "ocid1.subnet.oc1.eu-frankfurt-1.aaaaaaaa2hiol4ecg47copvj34fqyhkff5pofjqbaawmfwfp32atpxxsrg3q"}

#variable datacenter {default = "oci-w01dc"}
#variable datastore {default = "vsanDatastore"}
#variable cluster {default = "oci01-w01-consolidated01"}

variable baseTemplate {default = "Canonical-Ubuntu-22.04-2023.10.13-0"}
variable vmName {default="VMUGdemo-02"}
variable vmShape {default="VM.Standard.E4.Flex"}
variable vmCPU {default = 2}
variable vmMemory {default =8}

variable vmFolder {default = "OCVS"}
variable vmResourcePool {default = "LYXg:EU-FRANKFURT-1-AD-1"} // AD

variable vmnetwork {default = "Native OCI Services"}


