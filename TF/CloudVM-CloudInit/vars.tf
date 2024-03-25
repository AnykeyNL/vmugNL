
variable tenancyOCID {default = "ocid1.tenancy.oc1..aaaaaaaahe24eabqyiylme5zi2gpernbx7blo5vs3hkntxvlfvtzv2ciix5q"}
variable subnet {default = "ocid1.subnet.oc1.eu-frankfurt-1.aaaaaaaa2hiol4ecg47copvj34fqyhkff5pofjqbaawmfwfp32atpxxsrg3q"}

#variable datacenter {default = "oci-w01dc"}
#variable datastore {default = "vsanDatastore"}
#variable cluster {default = "oci01-w01-consolidated01"}

variable baseTemplate {default = "Canonical-Ubuntu-22.04-2023.10.13-0"}
variable vmName {default="VMUGdemo-02"}
variable vmCPU {default = 2}
variable vmMemory {default =8096}

variable vmFolder {default = "OCVS"}
variable vmResourcePool {default = "vmugnl"}

variable vmnetwork {default = "VLAN-2002-HCXDemo"}
variable vmIP {default = "10.100.12.52"}
variable vmNetmask {default = 24}
variable vmGateway {default = "10.100.12.1"}
variable vmDNS {default = "10.100.12.1"}

