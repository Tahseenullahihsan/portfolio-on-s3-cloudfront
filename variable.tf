variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "default_root_object" {
  description = "Default root object (e.g., index.html)"
  type        = string
  default     = "index.html"
}

variable "comment" {
  description = "Comment for CloudFront distribution"
  type        = string
  default     = "CDN for static site"
}
variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string

}