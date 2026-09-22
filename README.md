# Linux Operations Lab

A small hands-on Linux operations lab demonstrating practical Linux administration, troubleshooting, networking, service management, and Bash automation.

Built locally using Ubuntu on WSL2 with a deliberately small scope so the focus stays on core operational skills.

## What this project demonstrates

- Linux users, groups, ownership, and permissions
- File and directory access troubleshooting
- Process inspection and management
- `systemd` service configuration and management
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

## System health script

The project includes a small Bash health-check script:

```bash
./scripts/system-health.sh
```

It reports:

- Hostname
- CPU count
- Uptime and load
- Memory usage
- Root filesystem usage
- Top memory-consuming processes
- `linux-lab` systemd service status

Run it from the repository root:

```bash
chmod +x scripts/system-health.sh
./scripts/system-health.sh
```

## Example systemd service

The repository includes:

```text
systemd/linux-lab.service
```

The unit runs a small Python HTTP server on port `8000` and restarts it on failure. The checked-in unit reflects the local lab path and user, so update `User=` and `WorkingDirectory=` before installing it on another machine.

Typical verification commands used in the lab include:

```bash
systemctl status linux-lab
journalctl -u linux-lab
ss -lntp
curl http://127.0.0.1:8000
```

## Project structure

```text
linux-operations-lab/
├── labs/
│   ├── 01-permissions.md
│   ├── 02-services-logs.md
│   ├── 03-networking.md
│   └── 04-system-health.md
├── scripts/
│   └── system-health.sh
├── service/
│   └── index.html
├── systemd/
│   └── linux-lab.service
├── .gitignore
├── LICENSE
└── README.md
```

## Scope

This project is intentionally focused on Linux operations fundamentals rather than application complexity. The goal is to practice the kinds of service, process, logging, networking, permission, and system-health workflows that show up in backend, platform, DevOps, and SRE environments.
