---
title: "Homelab"
author: "Alecks"
---

This setup hosts all of my core infrastructure which consists of several Linux VMs and a couple LXC Containers. VM nodes run Proxmox VE (Clustered).

The VMs themself run various different services including game servers for me and my friends, aquaintances or small communities, a small jellyfin instance, matrix, this website, proxmox backup server vms for friends and also acts as a gateway for my friends homelabs using p2p vpn tunnels.
### Compute Nodes - [Live Status](https://status.alecks.dev)

| Name | CPU | RAM | Storage |
| -------- | ------- | ------- | ------ |
| au-prox-01 | Ryzen 5 5500 | 64GB DDR4 | 1TB NVMe, 6tb HDD |
| au-prox-02 | Core i7 8700 | 16GB DDR4 | 256GB NVMe, 2x 2tb HDDs|
| au-bak-01 | Core i5-7400T | 8GB DDR4 | 512GB NVMe |

(Anything on the status page not shown above is either a vm or vps)

### Organization
- All my stuff sits in a 15U server rack with a patch panel, rackmount power strip / pdu off ebay and amazon 
- Custom Ryzen servers are rackmounted in 2U [silverstone mini cases](https://www.ple.com.au/products/656663/silverstone-rm23-502-mini-2u-rackmount-industrial-server-chassis-w-dual-525-bays) and my Mini PCs sit on a shelf that came included with the rack.
- The UPS is mounted in at the bottom of the rack

### Backups & Monitoring
- Game servers are currently backed up daily to a cloudflare r2 bucket, vm disks are backed up to au-bak-01 which runs pbs.
- [HetrixTools](https://hetrixtools.com) monitors server resources (cpu, ram, storage and bandwidth usage), uptime, drive health, detects outages and pushes alerts to my ntfy server.
- Prometheus and Grafana extensively monitors vms, vpses and vm hosts and acts as a backup to HetrixTools, since its hosted on-prem it still collects metrics if my internet ever went down.
- [ntfy](https://ntfy.sh) notifies me of incidents picked up my hetrix with mobile push notifications, hosted on a cloud server so if my entire homelab goes offline I can still get nofified.

### Networking
- Netbird lets me access any vm or vm host running internally from outside my network without me needing to expose any ssh ports or run an ssh gateway. It also lets me establish private links between my rack and friends servers so I can run my reverse proxy service.
- My ISP uses [GSL](https://globalsecurelayer.com) for IP transit and peering at every local internet exchange which allows me to have low ping to almost every ISP in my city.
- My core router is a UDM Pro which I use to seperate my homelab and home network into their own vlans and connect my house to the internet.

### Reliability
- I have a 2000VA pure sinewave ups setup that can keep all my servers for any power outages that happen a couple times a year and also protects my stuff against brownouts and voltage spikes.
- Everything is built to automatically recover on boot if it gets fully shutdown.
- Internet has never gone down before, my router is reliable and been rock solid under load, currently working on getting a business plan with my provider.
