module "s3" {
  source      = "./module/s3"
  bucket_name = var.bucket_name
}
module "cloud-front" {
  source                = "./module/cloud-front"
  
  s3_bucket_name        = module.s3.bucket_name
  default_root_object   = var.default_root_object
  comment               = var.comment
}