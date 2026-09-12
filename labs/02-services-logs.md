# Lab 02 — Processes, Services, and Logs

## Objective

Practice Linux process inspection, service management, port verification, log inspection, and service recovery.

## Commands Practiced

```bash
pgrep
kill
jobs
systemctl
journalctl
ss
curl
tail
grep

```

## Service Exercise

Started a Python HTTP server and located the running process with:

```bash
pgrep -af http.server
```

Verified the service was reachable with:

```bash
curl -I http://localhost:8000
```

## Failure and Recovery

Stopped the server process and confirmed that the application was unavailable.

After creating `linux-lab.service`, managed the application with systemd:

```bash
sudo systemctl start linux-lab
systemctl status linux-lab
```

Verified that the process was listening on port 8000:

```bash
ss -ltnp | grep 8000
```

## Logs

Inspected service logs with:

```bash
journalctl -u linux-lab.service
```

The logs showed successful HTTP 200 requests.

## Key Takeaway

A running process alone does not prove an application is healthy.

Check:

Process → Port → Application Response → Logs
