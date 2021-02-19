# cisco-terraform-code

This is the sample terraform source code for Cisco Solutions.
Currently, ACI samples are only avaible.


## Getting Started

1. install terraform cli
1. clone the repository
`
git clone https://github.com/cisco-simonyang/cisco-terraform-templates.git
`
1. set the environment variable for APIC credential
```
$ export TF_VAR_apic='{username="admin", password="admin", url="https://<apic_ip>"}'
```

1. change the directory to a certain sample starting with numbering.
```
$ cd aci/05.infra_configuration
```
1. initialize the working directory with terraform files
```
$ terraform init
```
1. change the variables in files. `.tfvars` or `.tfvars.json` if .tfvars or .tfvars.json file exists or `variable.tf`
1. run the code
- if there is .tfvars file. it will read a specific variable file, and generate the tfstate file with the sample name with .tfvars file.
```
$ ./apply tenant1.tfvars 
```
- otherwise
```
$ terraform apply
```


## File Structure
```
.
|-- aci
|   |-- 00.terraform-aci-intro
|   |   |-- main.tf
|   |   |-- terraform.tfstate
|   |   `-- variable.tf
|   |-- 01.network-policy
|   |   |-- main.tf
|   |   |-- terraform.tfstate
|   |   |-- terraform.tfstate.backup
|   |   `-- variable.tf
|   |-- 02.contract-policy
|   |   |-- main.tf
|   |   |-- terraform.tfstate
|   |   `-- variable.tf
|   |-- 03.application-policies
|   |   |-- main.tf
|   |   |-- terraform.tfstate
|   |   |-- terraform.tfstate.backup
|   |   `-- variable.tf
|   |-- 04.static_port
|   |   |-- main.tf
|   |   |-- static_port.tf
|   |   |-- terraform.tfstate
|   |   |-- terraform.tfstate.backup
|   |   `-- variable.tf
|   |-- 05.infra_configuration
|   |   |-- apic1.tfvars
|   |   |-- main.tf
|   |   |-- terraform.tfstate
|   |   |-- terraform.tfstate.backup
|   |   `-- variables.tf
|   |-- 06.tenant-configuration
|   |   |-- apply.sh
|   |   |-- main.tf
|   |   |-- plan.sh
|   |   |-- tenant1.tfstate
|   |   |-- tenant1.tfstate.backup
|   |   |-- tenant1.tfvars
|   |   |-- tenant2.tfstate
|   |   |-- tenant2.tfvars
|   |   |-- terraform.tfstate
|   |   |-- terraform.tfstate.backup
|   |   |-- variables.tf
|   |   `-- variables.tf.sample
|   |-- 07.vcenter-static-port
|   |-- 08.vmm-domain
|   `-- 10.tenant_l3out_validation
|       |-- main.tf
|       `-- variable.tf
|-- asa        : ASA sample will be available
|-- dcnm       : DCNM sample will be available
|-- intersight : Intersight sample will be available
`-- README.md
```

