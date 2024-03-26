

## List VMware VMs and Oracle Cloud VMs
select name,power, num_cpu, memory/1024^4 as memory, _ctx['connection_name'] as platform  from vsphere_vm
union all
select display_name as name, lifecycle_state as power, cast(shape_config['ocpus'] as bigint) as num_cpu, cast(shape_config['memoryInGBs'] as bigint) as memory, _ctx['connection_name'] as platform from oci.oci_core_instance
order by num_cpu desc




