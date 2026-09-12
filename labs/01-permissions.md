# Lab 01 — Users and Permissions

## Objective

Practice Linux file permissions, ownership, users, groups, and basic permission troubleshooting.

## Commands Practiced

```bash
pwd
ls -la
whoami
id
groups
touch
mkdir
chmod
chown
cat
```

## What I Learned

Linux permissions are divided into three categories:

* Owner
* Group
* Others

The permission types are:

* `r` — read
* `w` — write
* `x` — execute or directory traversal

For example:

```text
-rw-r-----
```

means:

* Owner: read and write
* Group: read
* Others: no access

Numeric permissions use:

```text
4 = read
2 = write
1 = execute
```

For example:

```bash
chmod 640 file.txt
```

sets:

```text
Owner: read + write
Group: read
Others: none
```

## Troubleshooting Exercise

I created a protected directory and intentionally removed all permissions:

```bash
chmod 000 protected
```

Attempts to access the directory and file resulted in:

```text
Permission denied
```

I inspected the directory permissions and restored owner access with:

```bash
chmod 700 protected
```

After the change, I verified that the file could be accessed again.

## Ownership Exercise

I changed the group ownership of a file:

```bash
chown :cloudsupport protected/secret.txt
```

Then configured permissions so the owner could read and write, members of the group could read, and everyone else had no access:

```bash
chmod 640 protected/secret.txt
```

## Key Takeaway

When troubleshooting a Linux `Permission denied` error, inspect ownership and permissions before changing them. Avoid using overly broad permissions such as `chmod 777` when a smaller, more secure permission change will solve the problem.
