#!/bin/bash

# Variables
BUCKET_NAME="my-project-data-backup-20250823-abcdef123"
LOCAL_WEBSITE_DIR="/root/terraform_projects/project-2/portfoolio"  

# Sync files to S3
echo "Uploading website files to S3..."
aws s3 sync "$LOCAL_WEBSITE_DIR" s3://$BUCKET_NAME --delete
echo "✅ Upload complete."
# file is succefuly uplaod to the s3 bucket
