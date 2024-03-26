
resource "oci_core_instance" "MyOCIInstance" {
	agent_config {
		is_management_disabled = "false"
		is_monitoring_disabled = "false"
		plugins_config {
			desired_state = "DISABLED"
			name = "Vulnerability Scanning"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Management Agent"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Custom Logs Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute RDMA GPU Monitoring"
		}
		plugins_config {
			desired_state = "ENABLED"
			name = "Compute Instance Monitoring"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Auto-Configuration"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Compute HPC RDMA Authentication"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Block Volume Management"
		}
		plugins_config {
			desired_state = "DISABLED"
			name = "Bastion"
		}
	}
	availability_config {
		recovery_action = "RESTORE_INSTANCE"
	}
	availability_domain = "LYXg:EU-FRANKFURT-1-AD-1"
	compartment_id = "ocid1.compartment.oc1..aaaaaaaaj3bzcgi3kdg5ewytexdm652cyfhpgwzsf2sxub3dsj55tauwt6xa"
	create_vnic_details {
		assign_ipv6ip = "false"
		assign_private_dns_record = "true"
		assign_public_ip = "false"
		subnet_id = "ocid1.subnet.oc1.eu-frankfurt-1.aaaaaaaa2hiol4ecg47copvj34fqyhkff5pofjqbaawmfwfp32atpxxsrg3q"
	}
	display_name = var.vmName
	instance_options {
		are_legacy_imds_endpoints_disabled = "false"
	}
	metadata = {
		"ssh_authorized_keys" = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCYey/d8gfoX7KuePYYiFg9U6+w9ZulmHi3xYn7pquKaYv9KN3eAAfqywSmAydLQns7dDKqAyNq20WvdUFM+j2+dfnIek1o7QMhDZFDupToQq73v8p984LkazWrODCN4/SDNyYxQ/jeBRswXtQu8+49Rm/aI/W3u2uz6dDjxWFrDF9qfSX5XQB4fcmxB7J4z8jNm/Un0B/OM8uZV/Jm4lYC/BjXLFRIwNFRTow52n5mVR5e42ezQMxHdYEnE8cP8e+ELhHynybwjcas3mIAj/jRx83EVqznOBHpzb7bYK6hnp6T9VCv6UYjvCtk78voqpRKCpOdl4/cZtW0pvP/nNmr phpseclib-generated-key"
	}
	platform_config {
		is_symmetric_multi_threading_enabled = "true"
		type = "AMD_VM"
	}
	shape = var.vmShape
	shape_config {
		baseline_ocpu_utilization = "BASELINE_1_1"
		memory_in_gbs = "${var.vmMemory}"
		ocpus = "${var.vmCPU}"
	}
	source_details {
		source_id = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaa7fendmgdaogirdpoa4icidez5ug22bezdpviku7uwvx2mzjn7pzq"
		source_type = "image"
	}
}
