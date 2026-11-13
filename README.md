# terraform-lab-vcs

[Table of Contents](#-table-of-contents)

- [HCP Terraform Connectivity](#hcp-terraform-connectivity)
- [Folder and Files Structure](#folder-and-files-structure)
- [How to Use Existing Terraform Code](#how-to-use-existing-terraform-code)
- [How to Add an Existing Deployment](#how-to-add-an-existing-deployment)
- [Examples](#examples)

---

This repository contains Terraform code for lab networking infrastructure, including VPC and subnet deployments. It is configured to work with HCP Terraform for remote state management and workspace organization.

## HCP Terraform Connectivity

This project is connected to HCP Terraform with the following configuration:
- **Organization**: `laboratory1`
- **Workspaces**: `subnet`, `vpc`
- The `version.tf` files in each deployment directory configure the HCP Terraform cloud organization and workspace names.

## Folder and Files Structure

The following table describes the purpose of each folder and key file:

| Folder/File | Description |
|---|---|
| `deployment/subnet/` | Subnet deployment module with Terraform configuration |
| `deployment/vpc/` | VPC deployment module with Terraform configuration |
| `modules/subnet/` | Reusable subnet module resources |
| `modules/vpc/` | Reusable VPC module resources |
| `version.tf` | Terraform required version, provider configuration, and HCP Terraform cloud organization/workspace settings |
| `variables.tf` | Input variables: `aws_region` and `instances` (map of network configurations) |
| `main.tf` | Module deployment configuration referencing the modules |
| `provider.tf` | AWS provider configuration with region from variables |
| `data.tf` | Data sources, e.g., `aws_vpc` data lookup |
| `input.auto.tfvars` | Auto-generated variable values (not committed to VCS) |

## How to Use Existing Terraform Code

1. **Initialize the workspace**:
   ```bash
   terraform init
   ```

2. **Review and adjust variables** in `variables.tf` or via `*.auto.tfvars` files:
   - `aws_region`: AWS region string
   - `instances`: Map containing:
     - `vpc_name`: Name tag for the VPC
     - `cidr_block`: CIDR block for networking
     - `az`: Availability zone
     - `environment`: Environment label (e.g., dev, test, prod)

3. **Plan the deployment**:
   ```bash
   terraform plan
   ```

4. **Apply the deployment**:
   ```bash
   terraform apply
   ```

## How to Add an Existing Deployment

To add a new deployment to this repository:

1. **Create a new deployment directory** under `deployment/` (e.g., `deployment/my-new-deployment/`)

2. **Add the required Terraform files**:
   - `main.tf` - Module reference (copy from existing subnet/vpc and update source path)
   - `variables.tf` - Define `aws_region` and `instances` variables
   - `version.tf` - Terraform version and HCP Terraform configuration (update workspace name)
   - `provider.tf` - AWS provider configuration (if needed, may inherit from root)
   - `data.tf` - Any data sources required (if needed)
   - `input.auto.tfvars` - Optional: pre-populate variable values

3. **Update the module sources** in `main.tf` to point to the correct module paths:
   ```hcl
   module "vpc" {
     source = "../../modules/vpc"
     # ... variables ...
   }
   module "subnet" {
     source = "../../modules/subnet"
     # ... variables ...
   }
   ```

4. **Initialize and plan**:
   ```bash
   terraform init
   terraform plan
   ```

5. **Apply the deployment**:
   ```bash
   terraform apply
   ```

6. **Verify in HCP Terraform**: The new workspace will appear in your HCP Terraform organization `laboratory1` with the name you specified in `version.tf`.

## Examples

To add a new subnet to the existing subnet deployment, follow these steps:

1. **Add a new entry to the `instances` map** in `variables.tf` or `input.auto.tfvars`:
   ```hcl
   instances = {
     "subnet-vcs-001" = {
       vpc_name   = "vpc-private-vcs-001"
       cidr_block = "10.2.1.0/24"
       az         = "ap-southeast-1a"
       environment = "dev"
     }

     "subnet-new" = {
       vpc_name   = "vpc-private-new"
       cidr_block = "10.2.2.0/24"
       az         = "ap-southeast-1b"
       environment = "prod"
     }
   }
   ```

2. **Run `terraform plan`** to preview the changes:
   ```bash
   terraform plan
   ```

3. **Apply the changes**:
   ```bash
   terraform apply
   ```

4. **Verify in HCP Terraform**: The new workspace will appear in your HCP Terraform organization `laboratory1` with the name you specified.

*Last updated: 2026-11-13*

## HCP Terraform Connectivity

This project is connected to HCP Terraform with the following configuration:
- **Organization**: `laboratory1`
- **Workspaces**: `subnet`, `vpc`
- The `version.tf` files in each deployment directory configure the HCP Terraform cloud organization and workspace names.

## Folder and Files Structure

The following table describes the purpose of each folder and key file:

| Folder/File | Description |
|---|---|
| `deployment/subnet/` | Subnet deployment module with Terraform configuration |
| `deployment/vpc/` | VPC deployment module with Terraform configuration |
| `modules/subnet/` | Reusable subnet module resources |
| `modules/vpc/` | Reusable VPC module resources |
| `version.tf` | Terraform required version, provider configuration, and HCP Terraform cloud organization/workspace settings |
| `variables.tf` | Input variables: `aws_region` and `instances` (map of network configurations) |
| `main.tf` | Module deployment configuration referencing the modules |
| `provider.tf` | AWS provider configuration with region from variables |
| `data.tf` | Data sources, e.g., `aws_vpc` data lookup |
| `input.auto.tfvars` | Auto-generated variable values (not committed to VCS) |

## How to Use Existing Terraform Code

1. **Initialize the workspace**:
   ```bash
   terraform init
   ```

2. **Review and adjust variables** in `variables.tf` or via `*.auto.tfvars` files:
   - `aws_region`: AWS region string
   - `instances`: Map containing:
     - `vpc_name`: Name tag for the VPC
     - `cidr_block`: CIDR block for networking
     - `az`: Availability zone
     - `environment`: Environment label (e.g., dev, test, prod)

3. **Plan the deployment**:
   ```bash
   terraform plan
   ```

4. **Apply the deployment**:
   ```bash
   terraform apply
   ```

## How to Add an Existing Deployment

To add a new deployment to this repository:

1. **Create a new deployment directory** under `deployment/` (e.g., `deployment/my-new-deployment/`)

2. **Add the required Terraform files**:
   - `main.tf` - Module reference (copy from existing subnet/vpc and update source path)
   - `variables.tf` - Define `aws_region` and `instances` variables
   - `version.tf` - Terraform version and HCP Terraform configuration (update workspace name)
   - `provider.tf` - AWS provider configuration (if needed, may inherit from root)
   - `data.tf` - Any data sources required (if needed)
   - `input.auto.tfvars` - Optional: pre-populate variable values

3. **Update the module sources** in `main.tf` to point to the correct module paths:
   ```hcl
   module "vpc" {
     source = "../../modules/vpc"
     # ... variables ...
   }
   module "subnet" {
     source = "../../modules/subnet"
     # ... variables ...
   }
   ```

4. **Initialize and plan**:
   ```bash
   terraform init
   terraform plan
   ```

5. **Apply the deployment**:
   ```bash
   terraform apply
   ```

6. **Verify in HCP Terraform**: The new workspace will appear in your HCP Terraform organization `laboratory1` with the name you specified in `version.tf`.

## Examples

To add a new subnet to the existing subnet deployment, follow these steps:

1. **Add a new entry to the `instances` map** in `variables.tf` or `input.auto.tfvars`:
   ```hcl
   instances = {
     "subnet-vcs-001" = {
       vpc_name   = "vpc-private-vcs-001"
       cidr_block = "10.2.1.0/24"
       az         = "ap-southeast-1a"
       environment = "dev"
     }

     "subnet-new" = {
       vpc_name   = "vpc-private-new"
       cidr_block = "10.2.2.0/24"
       az         = "ap-southeast-1b"
       environment = "prod"
     }
   }
   ```

2. **Run `terraform plan`** to preview the changes:
   ```bash
   terraform plan
   ```

3. **Apply the changes**:
   ```bash
   terraform apply
   ```

4. **Verify in HCP Terraform**: The new workspace will appear in your HCP Terraform organization `laboratory1` with the name you specified.

---

*Last updated: 2026-11-13*
