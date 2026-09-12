# Linux Operations Lab

A small hands-on Linux operations lab demonstrating practical Linux administration, troubleshooting, networking, service management, and Bash automation.

Built locally using Ubuntu on WSL2 with a deliberately small scope.

## What This Project Demonstrates

- Linux users, groups, ownership, and permissions
- File and directory access troubleshooting
- Process inspection and management
- systemd service configuration and management
- Linux logs with `journalctl`
- TCP port inspection with `ss`
- HTTP service verification with `curl`
- Network interfaces and routing
- DNS troubleshooting
- CPU, memory, disk, and process inspection
- Basic Bash automation

## Labs

### 01 — Users and Permissions

Practiced Linux ownership and permissions using `chmod`, `chown`, users, groups, and controlled permission failures.

[View Lab](labs/01-permissions.md)

### 02 — Processes, Services, and Logs

Created and managed a Linux web service, inspected processes and ports, simulated a service outage, recovered the service, and reviewed logs.

[View Lab](labs/02-services-logs.md)

### 03 — Linux Networking

Practiced network interfaces, routes, localhost, TCP ports, DNS resolution, connectivity testing, and network troubleshooting.

[View Lab](labs/03-networking.md)

### 04 — System Health and Bash

Inspected CPU, memory, disk, and running processes and created a Bash script to automate basic Linux health checks.

[View Lab](labs/04-system-health.md)

## System Health Script

The project includes:

```bash
./scripts/system-health.sh
