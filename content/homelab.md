---
title: "Homelab Setup"
author: "Alecks"
---

> I recently wrote a post going in depth about my current homelab setup [here](/posts/homelab-2025).

This setup hosts all of my core infrastructure which consists of several Linux VMs and a couple LXC Containers. VM nodes run Proxmox VE (Clustered).
### Compute Nodes

| Name | CPU | RAM | Storage | Uses|
| -------- | ------- | ------- | ------ | ----- |
| Lightsail | Ryzen 5 5500 | 32GB DDR4 | 1TB NVMe | VMs, LXC |
| Railway | Intel i5-7400T | 8GB DDR4  |  1TB NVMe | Onsite Backups |  
### Backups & Monitoring
Daily backups of vm disks are sent to my local PBS server, then mirrored onto Backblaze B2 - [HetrixTools](https://hetrixtools.com) monitors server resources and uptime - [ntfy](https://ntfy.sh) notifies me of incidents with mobile push notifications.

### Reliability
Power outages happen at max a couple times a year (UPS backup will be installed soon to mitigate that) - Internet line has never gone down before - I use a Ubiquiti Edgerouter 4, an enterprise grade router built for 24/7 operation.