resource "aws_key_pair" "deployer" {
  key_name   = "Bastion-key"
  public_key = file ("~/.ssh/id_rsa.pub")
}

resource "aws_s3_bucket" "example" {
  bucket = "kaizen-ayselee"
}

resource "aws_s3_object" "object" {
  #bucket = aws_s3_bucket.example.bucket
  depends_on = [aws_s3_bucket.example]
  bucket = "kaizen-ayselee"
  key    = "provider.tf"
  source = "provider.tf"
}

resource "aws_s3_object" "object2" {
  #bucket = aws_s3_bucket.example.bucket
  depends_on = [aws_s3_object.object]
  bucket = "kaizen-ayselee"
  key    = "provider.tf"
  source = "provider.tf"
}
