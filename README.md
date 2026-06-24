# AWS Terraform Assignment

## Overview

This project provisions a small AWS infrastructure stack using Terraform. The goal is to demonstrate Infrastructure as Code (IaC) principles, reusable configuration, variable-driven deployment, outputs, and CI validation.

## Architecture

Internet
↓
Internet Gateway
↓
Route Table
↓
Public Subnet
↓
Security Group
↓
EC2 Instance (Ubuntu + Apache Web Server)

S3 Bucket (Object Storage)

## Resources Created

* AWS VPC
* Public Subnet
* Internet Gateway
* Route Table
* Route Table Association
* Security Group
* EC2 Instance (Ubuntu Server)
* S3 Bucket

## Prerequisites

* AWS Account
* AWS CLI Installed
* Terraform Installed
* Git Installed
* GitHub Account

## AWS Authentication

Configure AWS credentials using environment variables or AWS CLI.

Example:

aws configure

Verify access:

aws sts get-caller-identity

## Terraform Commands

Initialize Terraform:

terraform init

Format Terraform files:

terraform fmt

Validate configuration:

terraform validate

Preview infrastructure:

terraform plan

Create infrastructure:

terraform apply

Destroy infrastructure:

terraform destroy

## Variables

The following variables are configurable:

* aws_region
* project_name
* instance_type
* ami_id

Sample values are provided in terraform.tfvars.example.

## Outputs

Terraform provides:

* EC2 Public IP
* EC2 Public DNS
* S3 Bucket Name

## Backend Configuration

A sample S3 backend configuration is included in backend.tf.

In production:

* Terraform state should be stored in an S3 bucket.
* State locking should be enabled using DynamoDB.

Benefits:

* Shared state management
* State locking
* Team collaboration
* Recovery and auditing

## GitHub Actions

This repository includes a GitHub Actions workflow that automatically runs:

* terraform fmt -check
* terraform init
* terraform validate

on every push and pull request.

## Design Decisions

* AWS selected as the cloud provider.
* Ubuntu Server used as the EC2 operating system.
* Public subnet used for hosting a simple web workload.
* Security Group configured with HTTP (80) and SSH (22) access.
* S3 bucket used to satisfy object storage requirements.
* Variables used to improve reusability and maintainability.

## Future Improvements

For a production-grade deployment, the following enhancements can be added:

* Private Subnets
* NAT Gateway
* Application Load Balancer
* Auto Scaling Group
* IAM Roles
* CloudWatch Monitoring
* S3 Encryption
* Multi-AZ Deployment
* Remote State Backend
* Secrets Manager Integration

## AI Usage Declaration

ChatGPT was used for:

* Learning Terraform concepts
* Understanding AWS networking components
* Reviewing Terraform structure
* Documentation assistance

All Terraform code was manually reviewed, understood, and tested before submission.

## Bonus Implementation

A reusable EC2 Terraform module was created under `modules/ec2`.

The module accepts:

- AMI ID
- Instance Type
- Subnet ID
- Security Group ID
- Project Name

and returns:

- Public IP
- Public DNS

This demonstrates modular and reusable Infrastructure as Code practices.
