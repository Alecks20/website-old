
---
title: "Homelab Setup"
author: "Alecks"
---

> I recently wrote a post going in depth about my current homelab setup [here](/posts/homelab-2025).

This setup hosts all of my core infrastructure which consists of several Linux VMs and a couple LXC Containers. VM nodes run Proxmox VE (Clustered).

The VMs themself run various different services including remote workspaces, self-hosted applications, game servers and this website.

A few things are still hosted in the cloud like my tor relay (due to network limitations and isp rules) and game server nodes located in other regions.
### Compute Nodes

| Name | CPU | RAM | Storage | Uses|
| -------- | ------- | ------- | ------ | ----- |
| Navi | Ryzen 5 5500 | 32GB DDR4 | 1TB NVMe | Virtual Machines, Containers |
### Backups & Monitoring
- Daily backups of vm disks are sent to my local PBS server (incremental), then mirrored onto Backblaze B2 and stored for 7 days.
- [HetrixTools](https://hetrixtools.com) monitors server resources, uptime and detects outages.
- [ntfy](https://ntfy.sh) notifies me of incidents picked up my hetrix with mobile push notifications.

### Reliability
- Power outages happen at max a couple times a year and everything is designed to automatically recover when systems come back online (UPS backup will be installed soon to mitigate that)
- Internet has never gone down before and I use an enterprise grade router built for 24/7 operation.