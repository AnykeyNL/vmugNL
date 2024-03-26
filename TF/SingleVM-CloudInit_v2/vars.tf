
variable datacenter {default = "oci-w01dc"}
variable datastore {default = "vsanDatastore"}
variable cluster {default = "oci01-w01-consolidated01"}

variable baseTemplate {default = "TemplateUbuntu2204ci"}
variable vmName {default="VMUG-demo-01"}
variable vmCPU {default = 2}
variable vmMemory {default =8096}

variable vmFolder {default = "vmugnl"}
variable vmResourcePool {default = "vmugnl"}

variable vmnetwork {default = "VLAN-2002-HCXDemo"}
variable vmIP {default = "10.100.12."}
variable vmNetmask {default = 24}
variable vmGateway {default = "10.100.12.1"}
variable vmDNS {default = "10.100.12.1"}


