# Project Title

## Overview

This project provides a comprehensive setup for deploying a Spring Boot application on Amazon EKS (Elastic Kubernetes Service). It includes application code, Kubernetes manifests for deploying various components, and Terraform scripts to automate the EKS cluster creation. The application utilizes a MySQL database with a fully configured Kubernetes environment.

## Table of Contents

- [Getting Started](#getting-started)
- [Kubernetes Manifests](#kubernetes-manifests)
- [Terraform Code](#terraform-code)
- [Accessing the Application](#accessing-the-application)
- [Conclusion](#conclusion)

## Getting Started

To get started, clone the repository to your local machine:

```bash
git clone https://github.com/yourusername/yourproject.git
cd yourproject
```

Ensure you have the following prerequisites installed:

- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)

### Prerequisites

Before running the Terraform scripts, make sure you have configured your AWS credentials. You can do this by running:

```bash
aws configure
```

## Kubernetes Manifests

This project includes several Kubernetes manifest files, each responsible for deploying different components of the application. Below is a brief explanation of each manifest:

- **components.yaml**: This manifest defines the horizontal pod autoscaler metrics server.

- **hpa.yaml**: Horizontal Pod Autoscaler configuration that automatically scales the number of pods based on CPU utilization.

- **network-policy.yaml**: Defines network policies that restrict the traffic to and from application pods, enhancing security by controlling access.

- **sc.yaml**: Storage Class configuration for dynamically provisioning storage resources for persistent volumes.

- **statefulset.yaml**: Manages the deployment of stateful applications, specifically for MySQL in this case, ensuring stable and unique network identifiers and persistent storage.

- **deployment.yaml**: Defines the deployment strategy for stateless applications, including replicas and update strategies.

- **init-script-config-map.yaml**: Contains SQL initialization scripts for setting up the database schema and seeding initial data.

- **pdb.yaml**: Pod Disruption Budget configuration to ensure high availability by limiting the number of concurrent disruptions during voluntary disruptions.

- **secret.yaml**: Defines sensitive data such as database passwords and API keys in a secure manner.

- **headless-service.yaml**: Creates a headless service for direct access to individual pod IPs, often used with StatefulSets.

- **mysql-pvc.yaml**: Persistent Volume Claim for requesting storage resources required by MySQL.

- **provisioner.yaml**: Configures the necessary provisions for managing application state and dependencies.

- **service.yaml**: Defines the Kubernetes service that exposes the application to other services or external clients.

## Terraform Code

The Terraform code in the `terraform/` directory automates the creation of an EKS cluster. It provisions the necessary resources including:

- VPC
- Subnets
- EKS Cluster
- Node Groups
- IAM Roles and Policies

To deploy the EKS cluster, navigate to the `terraform/` directory and run:

```bash
terraform init
terraform apply
```

This will prompt for confirmation and begin the provisioning process.

## Accessing the Application

Once the EKS cluster is up and running, you can access the application through the Network Load Balancer (NLB) provisioned by the LoadBalancer controller. 

1. **Obtain the Load Balancer DNS Name**:
   After deployment, retrieve the Load Balancer's DNS name by running the following command:

   ```bash
   kubectl get svc
   ```

   Look for the service with the type `LoadBalancer`, and note its external DNS name.

2. **Access the Application**:
   Open a web browser and paste the Load Balancer's DNS name into the address bar. You should see the application running.

## Conclusion

This project provides a robust infrastructure for deploying a cloud-native application on EKS. The use of Kubernetes manifests ensures easy management and scalability, while Terraform automates the provisioning of the necessary AWS resources. For any questions or issues, feel free to raise an issue in the repository or contact the project maintainers.
