# AWS EKS Project.

## Overview

 Here we are trying to create the **aws eks** cluster from scratch.

## Prerequest

 Install Terraform 
 Install AWS CLI with login

## What are the Thinks we create in the tf file?

### step1

First we need to create the vpc 
- VPC
- IGW
- Routable
- NAT
- Subnet

### Step2

Next we need to create the IAM role

Here we need to create for master and worker and attach the policy for each of the nodes and masters

### step 3

Next we need to create the aws eks cluster and node group

