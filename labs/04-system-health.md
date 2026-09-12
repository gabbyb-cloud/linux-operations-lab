# Lab 04 — System Health and Bash

## Objective

Practice basic Linux system-health inspection and automate common checks with Bash.

## Commands Practiced

```bash
uptime
free -h
df -h /
ps aux
nproc
chmod
systemctl

```

## System Health Checks

Checked CPU count and system load with:

```bash
nproc
uptime
```

Checked memory usage with:

```bash
free -h
```

Checked root filesystem usage with:

```bash
df -h /
```

Checked the highest memory-consuming processes with:

```bash
ps aux --sort=-%mem | head
```

## Bash Automation

Created:

```text
scripts/system-health.sh
```

The script reports:

- Hostname
- CPU count
- Uptime and load
- Memory usage
- Root disk usage
- Top memory-consuming processes
- Linux lab service status

Made it executable with:

```bash
chmod +x scripts/system-health.sh
```

Then ran it with:

```bash
./scripts/system-health.sh
```

## Key Takeaway

A basic Linux health check should inspect multiple areas:

CPU/Load → Memory → Disk → Processes → Service Status

Bash can automate these repeatable checks into one command.
