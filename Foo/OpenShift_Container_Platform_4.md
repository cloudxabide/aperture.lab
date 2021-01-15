# OpenShift Container Platform 4 (libvirt/KVM)


## "Infrastructure Requirements"

### OCP Cluster

#### Phase (initial)

| Node              | Operating System  | Qty | vCPU | Virtual RAM | Storage    |   | vCPU | RAM | Storage |
|:------------------|:------------------|:---:|:----:|:------------|:-----------|:-:|------|:----|:------- |
| Bootstrap         | RHCOS             | 1   | 4    | 16 GB       | 120 GB     | - | 4    | 16  | 120     |
| Control plane     | RHCOS             | 1   | 4    | 16 GB       | 120 GB     | - | 4    | 16  | 120     |
| Compute (worker)  | RHCOS or RHEL 7.x | 2   | 2    | 8 GB        | 120 GB     | - | 4    | 16  | 240     |
|                   |                   |     |      |             | **totals** | = | 12   | 48  | 480     |

## Network Requirements
Documentation indicates that you need 2 x Load Balancers (LB) - but, there are 4 separate ports

### Endpoints
|                                     | Port  | Purpose
|:------------------------------------|:-----:|:--------------|
| api.{cluster_name}.{domain_name}    | 6443  | Kubernetes API 
| api.{cluster_name}.{domain_name}    | 22623 | Machine Config Server
| *.apps.{cluster_name}.{domain_name} | 443   | HTTPS traffic for Apps
| *.apps.{cluster_name}.{domain_name} | 80    | HTTP traffic for Apps

### DNS entries
| A REC                                     | IP             | 
|:------------------------------------------|:--------------:|
| api.{cluster_name}.{base_domain}.         | 192.168.126.5  |
| api-int.{cluster_name}.{base_domain}.     | 192.168.126.5  |
| *.apps.{cluster_name}.{base_domain}.      | 192.168.126.5  |
| bootstrap.{cluster_name}.{base_domain}.   | 192.168.126.10 |
| master1.{cluster_name}.{base_domain}.     | 192.168.126.21 |
| master2.{cluster_name}.{base_domain}.     | 192.168.126.22 |
| master3.{cluster_name}.{base_domain}.     | 192.168.126.23 |
| worker1.{cluster_name}.{base_domain}.     | 192.168.126.31 |
| worker2.{cluster_name}.{base_domain}.     | 192.168.126.32 |
| worker3.{cluster_name}.{base_domain}.     | 192.168.126.33 |
Files/var_named_chroot_var_named_masters_db.ocp4.aperture.lab
Files/var_named_chroot_var_named_masters_db.126.168.192.in-addr.arpa
