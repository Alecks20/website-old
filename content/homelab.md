---
title: "Homelab Setup"
author: "Alecks"
---

> I recently wrote a post going in depth about my current homelab setup [here](/posts/homelab-2025).

This setup hosts all of my core infrastructure which consists of several Linux VMs and a couple LXC Containers. Physical nodes run Proxmox VE (Clustered).
### Compute Nodes

| Name | CPU | RAM | Storage |
| -------- | ------- | ------- | ------ |
| Lightsail | Ryzen 5 5500 | 32GB DDR4 | 1TB SSD |
| Railway | Intel i5-7400T | 8GB DDR4  | 256GB SSD  |
### Backups & Monitoring
Daily backups of vm disks is sent to backblaze b2 - hetrixtools monitors server resources and uptime - ntfy notifies me of incidents with mobile push notifications.

### Reliability
Power outages happen at max a couple times a year (ups backup will be in place soon to mitigate that) - internet has never gone down before - I use a ubiquiti edgerouter 4, an enterprise-grade router built for 24/7 operation.