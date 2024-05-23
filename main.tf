# create S3 bucket
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "tichaterraformpracticebucket" {
  bucket = var.bucketname
}
# then run terraform plan to review what has changed


# define the ownership of the bucket
resource "aws_s3_bucket_ownership_controls" "bucketOwner" {
  bucket = aws_s3_bucket.tichaterraformpracticebucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# make bucket public
resource "aws_s3_bucket_public_access_block" "bucketPublic" {
  bucket = aws_s3_bucket.tichaterraformpracticebucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# access control configuration
resource "aws_s3_bucket_acl" "accessControl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.bucketOwner,
    aws_s3_bucket_public_access_block.bucketPublic,
  ]

  bucket = aws_s3_bucket.tichaterraformpracticebucket.id
  acl    = "public-read"
}