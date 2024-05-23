# create S3 bucket
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "aws_s3_bucket" "tichaterraformpracticebucket" {
  bucket = var.bucketname
}
# then run terraform plan to review what has changed