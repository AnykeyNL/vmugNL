
## List VMs
select name,power, num_cpu, memory, ip_address from vsphere_vm

## List Host cores
select * from vsphere_host
select moref, model, cpu_cores, memory from vsphere_host
select sum(cpu_cores), sum(memory)/(1024^3) as memoryTB from vsphere_host
select sum(cpu_cores), sum(memory)/(1024^4) as memoryTB from vsphere_host where model like 'ORACLE%'

## Total Actual storage consumption per VM Order by size in Gigabytes and on how many/which datastores
with  
    alldisks as (
        select 
            jsonb_array_elements(storage_consumed) as disks, 
            name, 
            moref 
        from vsphere.vsphere_vm) 
    select 
        moref, 
        (array_agg(name))[1] as Name, 
        sum(disks['Committed']::bigint/(1024*1024*1024)) as UsageGB, 
        count(disks['Committed']) as DatastoresCount,
        string_agg(disks['Datastore']['Value']::text, ', ') as Datastores
    from alldisks 
    group by moref
    order by UsageGB desc

## Show all virtual disks in order of size that are used by all the VMs with size and type information

with disks as (
    with devices as (
        select 
            name, 
            moref, 
            jsonb_array_elements(devices) as device     
        from 
            vsphere.vsphere_vm
        ) 
    select 
        moref,
        name,
        trim(both '"' from device['DeviceInfo']['Label']::text) as label,
        device['CapacityInKB']::bigint/(1024*1024) as sizeinGB,
        trim(both '"' from device['Backing']['FileName']::text) as filename,
        device['Backing']['ThinProvisioned']::boolean as thinprovisioned
    from 
        devices
)
    select 
       *
    from
        disks
    where
        label like '%Hard disk%' 
    order by sizeinGB

