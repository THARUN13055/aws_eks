# EKS Cluster Setup with ALB Ingress Controller

This guide provides step-by-step instructions for setting up an Amazon EKS cluster with an ALB Ingress Controller, including creating an OIDC provider, attaching policies, and configuring roles.

## Prerequisites

- An AWS account with permissions to create EKS clusters, IAM roles, and policies.
- AWS CLI installed and configured.
- `kubectl` installed and configured to interact with your EKS cluster.

## Steps

### Step 1: Create EKS Cluster

After creating your EKS cluster, you will receive an OIDC URL. Copy this URL for use in the next steps.

### Step 2: Create the Identity Provider

1. **Select the OIDC Provider**:
   - Go to the IAM console in the AWS Management Console.
   - Navigate to "Identity providers" under "Access management".

2. **Add a New OIDC Provider**:
   - Click on "Add provider".
   - Choose "OpenID Connect" as the provider type.
   - Paste the OIDC URL you copied from Step 1 into the "Provider URL" field.
   - In the "Audience" field, enter `sts.amazonaws.com`.

### Step 3: Attach the Policy for ALB

1. Download the necessary policy JSON file for the ALB Ingress Controller using the following command:
   ```bash
   wget <URL_TO_POLICY_JSON>

### Step 4: Create the Role and Attach the Policy

1. **Create a New IAM Role**:
   - Go to the IAM console in the AWS Management Console.
   - Click on "Roles" in the left navigation pane.
   - Click on the "Create role" button.
   - Choose "Web identity" as the trusted entity type.
   - Select the OIDC provider you created in Step 2 from the dropdown menu.
   - Click "Next: Permissions".

2. **Attach the Policy**:
   - In the permissions page, search for and select the policy you downloaded in Step 3.
   - Click "Next: Tags" (you can optionally add tags).
   - Click "Next: Review".

3. **Review and Create the Role**:
   - Provide a name for your role (e.g., `ALBIngressControllerRole`).
   - Review the settings and click on the "Create role" button to finalize the creation of the role.

### Step 5: Add the Trust Policy

1. **Edit the Trust Policy**:
   - After creating the role, you need to add a trust policy. Use the following JSON structure, replacing `<oidc id>` with your actual OIDC ID:

   ```json
   {
       "Version": "2012-10-17",
       "Statement": [
           {
               "Effect": "Allow",
               "Principal": {
                   "Federated": "arn:aws:iam::058264519347:oidc-provider/oidc.eks.ap-south-1.amazonaws.com/id/<oidc id>"
               },
               "Action": "sts:AssumeRoleWithWebIdentity",
               "Condition": {
                   "StringEquals": {
                       "oidc.eks.ap-south-1.amazonaws.com/id/<oidc id>:sub": "system:serviceaccount:kube-system:aws-load-balancer-controller",
                       "oidc.eks.ap-south-1.amazonaws.com/id/<oidc id>:aud": "sts.amazonaws.com"
                   }
               }
           }
       ]
   }