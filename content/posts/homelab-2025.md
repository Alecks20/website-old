+++
author = "Alecks"
title = "The state of my Homelab in 2025"
date = "2025-09-03"
description = ""
tags = [
    "servers","homelab","self-hosting"
]
+++


Currently my Homelab is used to run services for personal use, my stuff exposed to the internet and VMs for friends or people in my local community.

The original goal of this setup was to build a service that lets me cancel all of my vps subscriptions, which so far has succeeded, the next goal is to make the service as reliable or close to as reliable as a proper hosting provider.

##  Compute Nodes
Lightsail is my main machine running pretty much everything, Railway is used for monitoring and failover, they currently sit on a shelf but I plan to build a server rack and add some more machines later on.

Both machines run Proxmox VE clustered together and host various virtual machines.

| Name | CPU | RAM | Storage |
| -------- | ------- | ------- | ------ |
| Lightsail | Ryzen 5 5500 | 32GB DDR4 | 1TB SSD |
| Railway | Intel i5-7400T | 8GB DDR4  | 256GB SSD  |

## Networking
### Internet Line
Being in Australia on the NBN, I have an FTTP (Fibre to the Premises) connection, essentially a full fibre line which is perfect for reliability and performance.

My ISP is small and reasonably priced, they've never had an outage on my line and I consistently get full speeds with zero congestion. They even provide built-in inline DDoS Protection with [GSL](https://globalsecurelayer.com/ddos-protection) for no extra cost. On top of that, their support actually knows what they're talking about while taking less than a day to respond over email, probably one of the best setups you could possibly have for Homelabbing.

### Local Network
As my main router I use a Ubiquiti Edgerouter 4, an enterprise-grade business router built for performance, reliability and high uptime.

My network is segmented into 2 vLANs: one for my home network and another for my Homelab, this ensures that any breaches in my infrastructure don't spread to vulnerable IoT devices or other home devices.

## Exposing Services
Since my network has a static IP address, most public services are exposed via port forwarding. I run multiple web services so I have a central Caddy LXC container sitting on port 80/443 which forwards web traffic to all the backend VMs.

For some more critical or vulnerable services like Apache Guacamole & PhpMyAdmin I expose them with Cloudflare Tunnels behind Cloudflare Access for added security.

![](/images/homelab_2025_exposed.webp)
<sup>Diagram of everything I have directly exposed to the Internet.</sup>

## What I'm running on it
### [Kasm Workspaces](https://kasmweb.com)
This is a software that lets you run desktops or browsers in containers on your server and stream them in browser to your local machine over local network or the internet. I use it for running Kali Linux labs for penetration testing and spinning up a browser when DNS changes are taking a while to update on my machine.

It may also get a lot more use during my Tafe courses (If I get in), since I'll be taking an M4 Macbook Pro I won't be able to run x86 Linux VMs but this service will let me do that.

![](/images/kali_linux.webp)
<sup>A Kali Linux container running on my Kasm VM.</sup>

### [Pterodactyl Panel & Wings](https://pterodactyl.io)

This allows me to create and manage all of my game servers with a clean web interface while using secure isolated docker containers on the backend and provide game servers to friends or the local community.

### [Gitea](https://about.gitea.com)
A self-hosted GitHub/GitLab alternative, I trust GitHub more with durability so I mainly use my Gitea server for mirrors incase something happens to GitHub or my account on it.

### [Tor Relay (Middle)](https://torproject.org)
Tor is a decentralized system for anonymous communication that hides a users ip address by routing their internet traffic through a series of volunteer-run, encrypted relays.

I'm one of the volunteers your traffic gets routed through when using the network, I run a middle relay as its the least dangerous when it comes to law enforcement knocking at your door asking for traffic logs (If a criminal uses your relay for illegal activities).

### VPS Servers
I operate a small service for friends or people in my local community offering small linux VMs hosted in my homelab for free - find more about how that works [here](/posts/vps-service).

## Reliability
My goal of building my own hosting platform more reliable than a proper hosting provider is pretty much impossible without being in a datacenter, as homes typically don't have multiple internet lines or onsite diesel generators. However, I'm in the position where I can achieve relatively close to that level with my setup or at least good enough for my needs.

- **Power:**  Extremely reliable, I live in a fairly new area with pretty solid power infrastructure. My next upgrade will definitely be adding a UPS.
- **Internet:** I haven't had a single outage on my Internet line, speeds are always consistent with no congestion.
- **Services Interfering**: All services run in their own VMs with strict resource allocations. If one service crashes or maxxes out resources, nothing else is affected.

### Backups
I follow the industry-standard 3-2-1 rule where you have a copy on production, an onsite backup and an offsite backup. I run a Proxmox Backup Server onsite which is then sent up to Backblaze B2.

### Monitoring
Even though I do want to setup a proper onsite monitoring system with Prometheus & Grafana as a future project, HetrixTools is super easy to setup and does everything I need it to do - monitor uptime, system resources, network usage and active processes of each Node & VM.

## Conclusion
Even though my Homelab is in a great state for my needs, it can always improve, a few things I still want to do with it include:
- Setup an onsite monitoring system with Prometheus & Grafana
- Add a UPS to protect data integrity and keep systems up during short power outages
- Build a proper server rack and add more compute nodes (Including a proper storage server with multiple TBs of storage)

And more stuff will definitely come up throughout the years.

Thanks for reading.