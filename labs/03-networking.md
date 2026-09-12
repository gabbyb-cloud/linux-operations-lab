# Lab 03 — Linux Networking

## Objective

Practice basic Linux networking, routing, DNS resolution, port inspection, and connectivity troubleshooting.

## Commands Practiced

```bash
ip addr
ip route
ss
curl
ping
dig
getent

```

## Interface and Routing Checks

Identified the primary Linux network interface with:

```bash
ip -4 -br addr
```

The main WSL interface was `eth0`.

Checked the routing table with:

```bash
ip route
```

and identified the default gateway.

## Connectivity Testing

Verified the local web service through both localhost and the Linux interface address:

```bash
curl -I http://localhost:8000
curl -I http://172.25.62.21:8000
```

Both returned HTTP 200.

## DNS

Checked DNS resolution with:

```bash
dig google.com
getent hosts google.com
```

DNS successfully resolved the hostname to IP addresses.

## Failure Exercise

Tested an unused port:

```bash
curl --max-time 3 http://localhost:9999
```

The connection failed because no service was listening on that port.

## Key Takeaway

A reachable host does not guarantee that a specific application is reachable.

Check:

DNS → Route → Host → Port → Application
