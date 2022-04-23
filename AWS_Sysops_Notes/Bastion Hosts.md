## Introduction
Public facing-instance which allows you to SSH or RDP to private instances from an untrusted network.

`SSH/RDP -> || -> Bastion -> Private Instance`

- Has a public IP and is connected to the internet / untrusted networks.
- Security-hardened with any unnecessary services removed to reduce the attack surface.

## Example
```
Private Instance in Private Subnet <- Security Group (Only allows SSH/RDP from Bastion)

Bastion in Public Subnet <- Security GP ...
	... <- Route Table <- Internet

```

Also called a _Jump Box_.
