resource "oci_core_instance" "my_instance" {
    #Required
    availability_domain = data.oci_identity_availability_domains.ads[0].id
    compartment_id = data.oci_identity_compartments.myCompartment.id
    shape = var.instance_shape

    create_vnic_details {
        subnet_id = var.subnet
    }

    display_name = var.vmName

    launch_volume_attachments {
        #Required
        type = var.instance_launch_volume_attachments_type


        launch_create_volume_details {
            #Required
            size_in_gbs = 50
            volume_creation_type = var.instance_launch_volume_attachments_launch_create_volume_details_volume_creation_type
        }
    }
    metadata = var.instance_metadata
    platform_config {
        #Required
        type = var.instance_platform_config_type

        #Optional
        are_virtual_instructions_enabled = var.instance_platform_config_are_virtual_instructions_enabled
        config_map = var.instance_platform_config_config_map
        is_access_control_service_enabled = var.instance_platform_config_is_access_control_service_enabled
        is_input_output_memory_management_unit_enabled = var.instance_platform_config_is_input_output_memory_management_unit_enabled
        is_measured_boot_enabled = var.instance_platform_config_is_measured_boot_enabled
        is_memory_encryption_enabled = var.instance_platform_config_is_memory_encryption_enabled
        is_secure_boot_enabled = var.instance_platform_config_is_secure_boot_enabled
        is_symmetric_multi_threading_enabled = var.instance_platform_config_is_symmetric_multi_threading_enabled
        is_trusted_platform_module_enabled = var.instance_platform_config_is_trusted_platform_module_enabled
        numa_nodes_per_socket = var.instance_platform_config_numa_nodes_per_socket
        percentage_of_cores_enabled = var.instance_platform_config_percentage_of_cores_enabled
    }
    preemptible_instance_config {
        #Required
        preemption_action {
            #Required
            type = var.instance_preemptible_instance_config_preemption_action_type

            #Optional
            preserve_boot_volume = var.instance_preemptible_instance_config_preemption_action_preserve_boot_volume
        }
    }
    shape = var.instance_shape
    shape_config {

        #Optional
        baseline_ocpu_utilization = var.instance_shape_config_baseline_ocpu_utilization
        memory_in_gbs = var.instance_shape_config_memory_in_gbs
        nvmes = var.instance_shape_config_nvmes
        ocpus = var.instance_shape_config_ocpus
        vcpus = var.instance_shape_config_vcpus
    }
    source_details {
        #Required
        source_id = oci_core_image.test_image.id
        source_type = "image"

        #Optional
        boot_volume_size_in_gbs = var.instance_source_details_boot_volume_size_in_gbs
        boot_volume_vpus_per_gb = var.instance_source_details_boot_volume_vpus_per_gb
        instance_source_image_filter_details {
            #Required
            compartment_id = var.compartment_id

            #Optional
            defined_tags_filter = var.instance_source_details_instance_source_image_filter_details_defined_tags_filter
            operating_system = var.instance_source_details_instance_source_image_filter_details_operating_system
            operating_system_version = var.instance_source_details_instance_source_image_filter_details_operating_system_version
        }
        kms_key_id = oci_kms_key.test_key.id
    }
    preserve_boot_volume = false
}