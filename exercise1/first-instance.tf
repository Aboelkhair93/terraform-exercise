#provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "intro" {
  ami                    = "ami-0759f51a90924c166"
  instance_type          = "t2.micro"
  key_name               = "terr-key"
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = ["sg-0e4558dace17eb452"]
  tags = {
    Name = "first-terr"
  }
}