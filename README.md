# Linux Operations Lab

A hands-on Linux operations and troubleshooting environment focused on the fundamentals behind Site Reliability Engineering, Platform Engineering, cloud infrastructure, and production support.

The lab practices operating a Linux-hosted service, diagnosing failures, investigating logs and networking, inspecting system health, recovering services, and automating repeatable operational checks with Bash.

> **Operational focus:** Observe → Diagnose → Recover → Verify → Automate

---

## Why This Project Exists

Reliable systems depend on more than application code.

When a service becomes unavailable or behaves unexpectedly, engineers need to determine whether the problem is coming from the process, service manager, permissions, networking, system resources, or the application itself.

This project provides a small environment for practicing those Linux troubleshooting workflows directly.

The application is intentionally simple so the focus stays on operating the system around it.

Built locally using Ubuntu on WSL2.

---

## What This Project Demonstrates

- Linux users, groups, ownership, and permissions
- File and directory access troubleshooting
- Process inspection and management
- `systemd` service operation and recovery
- Log investigation with `journalctl`
- TCP port and socket inspection with `ss`
- HTTP verification with `curl`
- Network interfaces and routing
- DNS and connectivity troubleshooting
- CPU, memory, disk, load, and process inspection
- Bash automation for repeatable health checks
- Failure investigation and recovery verification

---

## Operational Scenarios

| Scenario | Investigation | Recovery / Response | Verification |
| --- | --- | --- | --- |
| Service unavailable | `systemctl`, `journalctl`, process and port inspection | Restore the service | `systemctl`, `ss`, `curl` |
| Permission failure | Inspect users, groups, ownership, and mode bits | Correct ownership or permissions | Retry the blocked operation |
| Port / connectivity problem | Inspect listeners, interfaces, routes, and connectivity | Isolate the service or network layer involved | Repeat connection and HTTP checks |
| DNS issue | Inspect name-resolution behavior and connectivity | Identify where resolution is failing | Repeat DNS and connectivity checks |
| Host health concern | Inspect CPU, memory, disk, load, and processes | Identify the affected resource or process | Re-run health checks |
| Repeated manual diagnostics | Collect common host checks individually | Automate checks with Bash | Run the health script |

---

## Troubleshooting Workflow

The labs follow a repeatable operational troubleshooting process.

### 1. Observe

Start with the visible symptom.

Examples:

- HTTP request fails
- service is not running
- permission is denied
- expected port is not listening
- hostname cannot be resolved
- host resources need inspection

### 2. Inspect

Collect information before changing the system.

Typical tools include:

```text
systemctl
journalctl
ps
ss
curl
ip
free
df
```

### 3. Isolate

Determine which layer is responsible for the behavior.

```text
Application
    |
Service Manager
    |
Process
    |
Permissions
    |
Networking
    |
Host Resources
```

### 4. Recover

Apply the smallest appropriate corrective action.

Examples include restarting a service or correcting file ownership and permissions.

### 5. Verify

Do not assume the fix worked.

Confirm service state, listening ports, and HTTP behavior after recovery.

### 6. Automate

If the same diagnostic information is repeatedly needed, automate the collection process.

---

## Labs

### 01 — Users, Groups, and Permissions

Practiced Linux access-control behavior using users, groups, ownership, `chmod`, and `chown`.

The lab includes controlled permission failures to demonstrate how Linux determines whether users and processes can access files and directories.

**Skills practiced**

```text
users
groups
ownership
chmod
chown
permission troubleshooting
```

[View Lab](labs/01-permissions.md)

### 02 — Processes, Services, and Logs

Created and operated a Linux HTTP service using `systemd`.

The lab includes process inspection, service management, port verification, log analysis, a controlled service outage, recovery, and post-recovery verification.

**Operational tools**

```text
systemctl
journalctl
ps
ss
curl
```

[View Lab](labs/02-services-logs.md)

### 03 — Linux Networking

Practiced host-level Linux networking and connectivity troubleshooting.

Topics include:

- network interfaces
- routing
- localhost communication
- listening TCP ports
- DNS resolution
- connectivity testing

[View Lab](labs/03-networking.md)

### 04 — System Health and Bash Automation

Inspected the health of a Linux host using CPU, memory, disk, load, and process information.

The lab then turns several common manual checks into a repeatable Bash health-check utility.

[View Lab](labs/04-system-health.md)

---

## Operational Automation

Repeated diagnostic commands can slow down troubleshooting and lead to inconsistent information collection.

The project therefore includes:

```bash
./scripts/system-health.sh
```

The script reports:

- Hostname
- CPU count
- Uptime and system load
- Memory utilization
- Root filesystem usage
- Highest-memory processes
- `linux-lab` systemd service status

Run it from the repository root:

```bash
chmod +x scripts/system-health.sh
./scripts/system-health.sh
```

This provides a repeatable first-pass snapshot of host health during an investigation.

---

## Example systemd Service

The repository includes:

```text
systemd/linux-lab.service
```

The service runs a small Python HTTP server on port `8000` and is configured to restart after failure.

The checked-in unit reflects the local lab environment, so `User=` and `WorkingDirectory=` should be updated before installing it on another host.

Typical operational verification:

```bash
systemctl status linux-lab
journalctl -u linux-lab
ss -lntp
curl http://127.0.0.1:8000
```

These commands answer four different questions:

```text
Is systemd managing the service?
            |
What has the service logged?
            |
Is the expected port listening?
            |
Can the application respond successfully?
```

---

## Recovery Exercise

One lab deliberately stops the HTTP service to create an availability failure.

The recovery workflow is:

```text
HTTP request fails
        |
        v
Inspect service state
        |
        v
Inspect logs
        |
        v
Inspect process / listening port
        |
        v
Restore service
        |
        v
Verify systemd state
        |
        v
Verify TCP listener
        |
        v
Verify HTTP response
```

The purpose is not simply to restart a process.

The exercise demonstrates the difference between **making a change** and **verifying recovery**.

---

## Project Structure

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

---

## Engineering Takeaways

### Observe before changing

Logs, service state, ports, processes, and resource information should be collected before applying a fix.

### Troubleshoot by layer

A failed request does not automatically mean the application itself is broken.

The problem may exist in the service manager, process state, permissions, networking, or host environment.

### Recovery requires verification

Restarting a service is an action.

Confirming that the process is healthy, the expected port is listening, and the application responds successfully verifies recovery.

### Automate repetitive diagnostics

Commands that are repeatedly used during investigations are good candidates for small operational tools.

---

## Engineering Focus

This repository intentionally keeps the application simple so the engineering focus remains on Linux operations.

The project practices the foundation behind reliable service operation:

**Observe → Diagnose → Recover → Verify → Automate**

These workflows are directly relevant to Site Reliability Engineering, Platform Engineering, cloud infrastructure, and production backend systems.
