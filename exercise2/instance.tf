resource "aws_instance" "mysec-instance" {
  ami = var.AMIS[var.REGION]
  instance_type = "t2.micro"
  availability_zone = var.ZONE1
  key_name               = "terr-key"
  vpc_security_group_ids = ["sg-0e4558dace17eb452"]
  tags = {
    Name = "sec-terr"
  }
}