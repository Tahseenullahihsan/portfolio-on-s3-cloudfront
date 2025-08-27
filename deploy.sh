#!/bin/bash

echo "🔍 Uploading website files to S3..."

# Set working directory (Jenkins workspace)
WORKSPACE_DIR=$(pwd)
TARGET_DIR="$WORKSPACE_DIR/portfoolio"

# Load .tfvars file path from env (Jenkins injected secret file)
TFVARS_FILE="$TFVARS"

# Parse bucket name from .tfvars file
BUCKET_NAME=$(grep 'bucket_name' "$TFVARS_FILE" | cut -d '=' -f2 | tr -d ' "\r\n')


if [ -z "$BUCKET_NAME" ]; then
    echo "❌ ERROR: Could not extract bucket name from $TFVARS_FILE"
    exit 1
fi

# Confirm directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "❌ ERROR: The folder $TARGET_DIR does not exist."
    exit 1
fi

# Upload to S3
aws s3 cp "$TARGET_DIR" "s3://$BUCKET_NAME/" --recursive

echo "✅ Upload complete to bucket: $BUCKET_NAME"
# this is hte deploy .sh file fr hte ci/cd dinamically 