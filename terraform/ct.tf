module "cloudtrail" {
  source = "github.com/azavea/terraform-aws-cloudtrail?ref=0.1.0"

  region           = "us-east-1"
  create_s3_bucket = true
  s3_bucket_name   = "mysite-logs"
  s3_key_prefix    = "cloudtrail"

  enable_s3_bucket_expiration  = false
  s3_bucket_days_to_expiration = 90

  enable_s3_bucket_transition        = true
  s3_bucket_days_to_transition       = 90
  s3_bucket_transition_storage_class = "ONEZONE_IA"

  enable_logging             = true
  enable_log_file_validation = false

  include_global_service_events = true
  is_multi_region_trail         = false
  is_organization_trail         = false

  project     = "My Site"
  environment = "Production"
}
