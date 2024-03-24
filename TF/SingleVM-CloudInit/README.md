
Prepare Linux OS (Ubuntu) for cloud init via vmware guest tools

```
rm -rf /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg
rm -rf /etc/cloud/cloud.cfg.d/99-installer.cfg
rm -rf /etc/netplan/00-installer-config.yaml
echo "disable_vmware_customization: false" >> /etc/cloud/cloud.cfg
echo "datasource_list: [ VMware, OVF, None ]" > /etc/cloud/cloud.cfg.d/90_dpkg.cfg
```