// ID identifying the cluster to create. Use your username so that resources created can be tracked back to you.
cluster_id = "ocp4"

// Domain of the cluster. This should be "${cluster_id}.${base_domain}".
cluster_domain = "ocp4.gtslabs.ibm.com"

// Base domain from which the cluster domain is a subdomain.
base_domain = "gtslabs.ibm.com"

// Name of the vSphere server. The dev cluster is on "vcsa.vmware.devcluster.openshift.com".
vsphere_server = "10.94.76.196"

// User on the vSphere server.
vsphere_user = "administrator@vsphere.local"

// Password of the user on the vSphere server.
vsphere_password = "R@d1calTeam"

// Name of the vSphere cluster. The dev cluster is "devel".
vsphere_cluster = "cluster1"

// Name of the vSphere data center. The dev cluster is "dc1".
vsphere_datacenter = "datacenter1"

// Name of the vSphere data store to use for the VMs. The dev cluster uses "nvme-ds1".
vsphere_datastore = "vsanDatastore"

// Name of the VM template to clone to create VMs for the cluster. The dev cluster has a template named "rhcos-latest".
vm_template = "rhcos-latest"

// The machine_cidr where IP addresses will be assigned for cluster nodes.
// Additionally, IPAM will assign IPs based on the network ID. 
machine_cidr = "192.168.60.0/24"

// The number of control plane VMs to create. Default is 3.
control_plane_count = 3

// The number of compute VMs to create. Default is 3.
compute_count = 3

// URL of the bootstrap ignition. This needs to be publicly accessible so that the bootstrap machine can pull the ignition.
bootstrap_ignition_url = "http://192.168.60.254:8080/ignition/bootstrap.ign"

// Ignition config for the control plane machines. You should copy the contents of the master.ign generated by the installer.
control_plane_ignition = <<END_OF_MASTER_IGNITION
{"ignition":{"config":{"append":[{"source":"https://api-int.ocp4.gtslabs.ibm.com:22623/config/master","verification":{}}]},"security":{"tls":{"certificateAuthorities":[{"source":"data:text/plain;charset=utf-8;base64,LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURFRENDQWZpZ0F3SUJBZ0lJUThMV1RsSWNYQmN3RFFZSktvWklodmNOQVFFTEJRQXdKakVTTUJBR0ExVUUKQ3hNSmIzQmxibk5vYVdaME1SQXdEZ1lEVlFRREV3ZHliMjkwTFdOaE1CNFhEVEU1TURneU16RTFOREUwTTFvWApEVEk1TURneU1ERTFOREUwTTFvd0pqRVNNQkFHQTFVRUN4TUpiM0JsYm5Ob2FXWjBNUkF3RGdZRFZRUURFd2R5CmIyOTBMV05oTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUF6Y3F0MStmbzM3UGIKTG4vVWhianVydVJnYTJ6L1hjaGMvRW5zY0pGcU56TGhVejBxVnRYMmZReTNqSXI1OTczUDNYeE1aMTZnYVptMApzZU0yWHl1d2JpeC9BZWJvVkF6bUZ1MUx2dHZ1ZFpGRWR6allkS1k4dGxtT1o5aS9JMi9aQ25YT0hyV3pxd3dXCmE4dm90TkdhbGVUN3VMcGFMb0JYRHNZY2c2dEV6Tkw1T2ttTUM3OE5vb1FWN2tJTUdVTEkxMDRHbmhNUHRZc00KVTVobGdFVVB1blF3RFdVM1UzcTdWOUZPNHkwRlpOc29OSW1URnNSRVJHRHV5Q21rakswWTBhaEFkSVIwQlF1ZwpXVkxpcHd5OWdXMlFiZHk4RTVoR1RpOThTVmFQNmxRRzVJNGFxMFlOQmo2c2xSK1hHWlBhaDRLOWRHU3hUSkJICnhveGZxM2Y4eXdJREFRQUJvMEl3UURBT0JnTlZIUThCQWY4RUJBTUNBcVF3RHdZRFZSMFRBUUgvQkFVd0F3RUIKL3pBZEJnTlZIUTRFRmdRVXhxOGJEWjBNeWV0RFo2OUlmNjJSYllYSmw2MHdEUVlKS29aSWh2Y05BUUVMQlFBRApnZ0VCQURac2JoZVVJa29heUhWOExqOENqcUxuWVg4M3NnSFlHY3hnVURhdnNrMTU5Wk1jQjUzb2NQemQ1bFZwClJCdWpuVXZTVnRCWjBvNUdjMTRTQnpJK0hrNG9DZllBUVNHb2xtZnlwQUxOWGluNlFEcmxDRkh3SzFPSlJ4TWwKM2I1U1RDUUpsMUZEeEM1NnIvdFdqZDJ0YU1wSWFBdUo2V3Nndkltdk0wSFlhNHVteTlackNaYlR0VEM1dzJlVQpqQjYzaCt0QlY1MWtQODNpZ1JOT3Y2WWN6TVBBM1NwVG9DZU9wc3lxdVF0NDZYdHNXaTE5cTNoK3BTcDBVamhSCnNrRGJRZDBtOEVWWHNBQXhqU1orbGNnZDVjalRXdDZCa3VJL3VZOFdRVldqZ0Fub2MxS2d3RzlXQW45ZUpmemoKM1FZTC8xYmJRdnRXNHJqeThXV1FFQmw3OVVjPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==","verification":{}}]}},"timeouts":{},"version":"2.2.0"},"networkd":{},"passwd":{},"storage":{},"systemd":{}}
END_OF_MASTER_IGNITION

// Ignition config for the compute machines. You should copy the contents of the worker.ign generated by the installer.
compute_ignition = <<END_OF_WORKER_IGNITION
{"ignition":{"config":{"append":[{"source":"https://api-int.ocp4.gtslabs.ibm.com:22623/config/worker","verification":{}}]},"security":{"tls":{"certificateAuthorities":[{"source":"data:text/plain;charset=utf-8;base64,LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURFRENDQWZpZ0F3SUJBZ0lJUThMV1RsSWNYQmN3RFFZSktvWklodmNOQVFFTEJRQXdKakVTTUJBR0ExVUUKQ3hNSmIzQmxibk5vYVdaME1SQXdEZ1lEVlFRREV3ZHliMjkwTFdOaE1CNFhEVEU1TURneU16RTFOREUwTTFvWApEVEk1TURneU1ERTFOREUwTTFvd0pqRVNNQkFHQTFVRUN4TUpiM0JsYm5Ob2FXWjBNUkF3RGdZRFZRUURFd2R5CmIyOTBMV05oTUlJQklqQU5CZ2txaGtpRzl3MEJBUUVGQUFPQ0FROEFNSUlCQ2dLQ0FRRUF6Y3F0MStmbzM3UGIKTG4vVWhianVydVJnYTJ6L1hjaGMvRW5zY0pGcU56TGhVejBxVnRYMmZReTNqSXI1OTczUDNYeE1aMTZnYVptMApzZU0yWHl1d2JpeC9BZWJvVkF6bUZ1MUx2dHZ1ZFpGRWR6allkS1k4dGxtT1o5aS9JMi9aQ25YT0hyV3pxd3dXCmE4dm90TkdhbGVUN3VMcGFMb0JYRHNZY2c2dEV6Tkw1T2ttTUM3OE5vb1FWN2tJTUdVTEkxMDRHbmhNUHRZc00KVTVobGdFVVB1blF3RFdVM1UzcTdWOUZPNHkwRlpOc29OSW1URnNSRVJHRHV5Q21rakswWTBhaEFkSVIwQlF1ZwpXVkxpcHd5OWdXMlFiZHk4RTVoR1RpOThTVmFQNmxRRzVJNGFxMFlOQmo2c2xSK1hHWlBhaDRLOWRHU3hUSkJICnhveGZxM2Y4eXdJREFRQUJvMEl3UURBT0JnTlZIUThCQWY4RUJBTUNBcVF3RHdZRFZSMFRBUUgvQkFVd0F3RUIKL3pBZEJnTlZIUTRFRmdRVXhxOGJEWjBNeWV0RFo2OUlmNjJSYllYSmw2MHdEUVlKS29aSWh2Y05BUUVMQlFBRApnZ0VCQURac2JoZVVJa29heUhWOExqOENqcUxuWVg4M3NnSFlHY3hnVURhdnNrMTU5Wk1jQjUzb2NQemQ1bFZwClJCdWpuVXZTVnRCWjBvNUdjMTRTQnpJK0hrNG9DZllBUVNHb2xtZnlwQUxOWGluNlFEcmxDRkh3SzFPSlJ4TWwKM2I1U1RDUUpsMUZEeEM1NnIvdFdqZDJ0YU1wSWFBdUo2V3Nndkltdk0wSFlhNHVteTlackNaYlR0VEM1dzJlVQpqQjYzaCt0QlY1MWtQODNpZ1JOT3Y2WWN6TVBBM1NwVG9DZU9wc3lxdVF0NDZYdHNXaTE5cTNoK3BTcDBVamhSCnNrRGJRZDBtOEVWWHNBQXhqU1orbGNnZDVjalRXdDZCa3VJL3VZOFdRVldqZ0Fub2MxS2d3RzlXQW45ZUpmemoKM1FZTC8xYmJRdnRXNHJqeThXV1FFQmw3OVVjPQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==","verification":{}}]}},"timeouts":{},"version":"2.2.0"},"networkd":{},"passwd":{},"storage":{},"systemd":{}}
END_OF_WORKER_IGNITION


// Set ipam and ipam_token if you want to use the IPAM server to reserve IP
// addresses for the VMs.

// Address or hostname of the IPAM server from which to reserve IP addresses for the cluster machines.
//ipam = "139.178.89.254"

// Token to use to authenticate with the IPAM server.
//ipam_token = "TOKEN_FOR_THE_IPAM_SERVER"


// Set bootstrap_ip, control_plane_ip, and compute_ip if you want to use static
// IPs reserved someone else, rather than the IPAM server.

// The IP address to assign to the bootstrap VM.
bootstrap_ip = "192.168.60.253"

// The IP addresses to assign to the control plane VMs. The length of this list
// must match the value of control_plane_count.
control_plane_ips = ["192.168.60.10", "192.168.60.11", "192.168.60.12"]

// The IP addresses to assign to the compute VMs. The length of this list must
// match the value of compute_count.
compute_ips = ["192.168.60.30", "192.168.60.31", "192.168.60.32"]
