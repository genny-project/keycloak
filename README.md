# Keycloak
Genny Keycloak

## Host system setup:

Increase buffer sizes to fix warning below:

```
the send buffer of socket ManagedDatagramSocketBinding was set to 1MB, but the OS only allocated 212.99KB
the receive buffer of socket ManagedDatagramSocketBinding was set to 20MB, but the OS only allocated 212.99KB
the send buffer of socket ManagedMulticastSocketBinding was set to 1MB, but the OS only allocated 212.99KB
the receive buffer of socket ManagedMulticastSocketBinding was set to 25MB, but the OS only allocated 212.99KB.
```

On Linux systems, in /etc/sysctl.conf add those two lines :

```
# Allow a 25MB UDP receive buffer for JGroups
net.core.rmem_max = 26214400
# Allow a 1MB UDP send buffer for JGroups
net.core.wmem_max = 1048576
```
Then run this command for the changes to take effect :
```Linux
sudo sysctl -p
```
 


 

