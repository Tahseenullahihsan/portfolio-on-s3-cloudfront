output "s3_website_endpoint" {
  value = module.s3.bucket_website_endpoint
}

output "cloudfront_url" {
  value = module.cloud-front.cloudfront_domain_name
}
