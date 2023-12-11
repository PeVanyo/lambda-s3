# Serverless Infrastructure with AWS Lambda and S3

This repository contains Terraform configuration files for deploying a serverless application using AWS Lambda and S3. The setup includes an AWS Lambda function triggered by the addition of a file to an S3 bucket, along with necessary IAM roles and policies.

## Prerequisites

Before you begin, ensure you have the following installed:
- [Terraform](https://www.terraform.io/downloads.html) (v1.6.4 or later)
- [AWS CLI](https://aws.amazon.com/cli/)
- AWS account with required permissions to create the resources

## Configuration

The project uses variables defined in `example.tfvars`. Before deploying, update this file with your specific configuration.

## Deployment Steps

1. **Clone the Repository**:
   ```
   git clone https://github.com/PeVanyo/lambda-s3
   cd lambda-s3
   ```

2. **Create an S3 bucket for the backend**:
    Create an S3 bucket in your AWS account and update the s3_bucket_name in the example.tfvars file.

3. **Initialize Terraform**:
    ```
    terraform init
    ```

4. **Create a Terraform workspace**:
    ```
    terraform workspace new <workspace-name>
    ```

5. **Review the Terraform Plan**:
    ```
    terraform plan -var-file="example.tfvars"
    ```

6. **Apply the Configuration**:
    ```
    terraform apply -var-file="example.tfvars"
    ```

## Resources Created

This configuration will create the following resources:

    AWS Lambda Function
    AWS Lambda Layer
    AWS S3 Bucket
    IAM Roles and Policies
    S3 Bucket Notification Configuration

## Test the Setup

1. **Upload a file to S3**:
Upload the sample.txt file into the lambda_bucket (s3). 

2. **Open the Log events**:
Go to CloudWatch -> Log groups -> /aws/lambda/<lambda_function_name> -> Select the latest Log stream. 
You should see logs like:
"Received event for bucket: ...";
"File retrieved and read successfully.";
"Word count: ...".

## Clean Up

1. **Empty the S3 bucket <s3_bucket_name>**

2. **Run**:
    ```
    terraform destroy -var-file="example.tfvars"
    ```
