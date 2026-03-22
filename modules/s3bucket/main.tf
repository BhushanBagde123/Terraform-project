resource "aws_s3_bucket" "frontend" {
  bucket = "my-form-frontend-bucket"
}
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.frontend.id
  key    = "index.html"
  source = "./frontend/index.html"
  content_type = "text/html"
}

# resource "aws_s3_bucket_public_access_block" "block" {
#   bucket = aws_s3_bucket.frontend.id

#   block_public_acls   = true
#   block_public_policy = true
# }