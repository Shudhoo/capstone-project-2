# This is aws-key-pair
variable "aws-key-pairs" {}
output "aws-key-pair-output" {
  value = aws_key_pair.aws-key-pair.key_name
}
resource "aws_key_pair" "aws-key-pair" {
  key_name = "mykey"
  public_key = var.aws-key-pairs
}