
variable datacenter {default = "oci-w01dc"}
variable datastore {default = "vsanDatastore"}
variable cluster {default = "oci01-w01-consolidated01"}

variable baseTemplate {default = "Ubuntu22-Server-TemplateMaster"}
variable vmName {default="DemoWebServer"}
variable vmCPU {default = 2}
variable vmMemory {default =8096}
variable vmFolder {default = "Richard"} # Example: "your-folder/your-subfolder"
variable vmResourcePool {default = "Richard"}
variable vmnetwork {default = "VLAN-2002-HCXDemo"}
variable vmIP {default = "10.100.12.51"}
variable vmNetmask {default = 24}
variable vmGateway {default = "10.100.12.1"}
variable vmDNS {default = "10.100.12.1"}


