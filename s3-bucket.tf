provider "aws" {
  region = "eu-west-1"
}

# Create the S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "rsschooldevops1991" # Ensure this bucket name is globally unique
}

# Attach the bucket policy after the bucket is created
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.my_bucket.bucket # Use the bucket reference dynamically

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          AWS = aws_iam_role.GithubActionsRole.arn # Use the role dynamically
        },
        Action = "s3:*",
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.my_bucket.bucket}",
          "arn:aws:s3:::${aws_s3_bucket.my_bucket.bucket}/*"
        ]
      }
    ]
  })
}

# Output the S3 bucket name
output "s3_bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}
