resource "aws_key_pair" "terraform-key" {
  key_name   = "terrakey"
  public_key = file("terra-key.pub")
}

resource "aws_instance" "terra-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.terraform-key.key_name
  vpc_security_group_ids = ["sg-0780815f55104be8a"]
  tags = {
    Name    = "terra-Instance"
    Project = "terra5"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {

    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("terra-key")
    host        = self.public_ip
  }
}

output "PublicIP" {
  value = aws_instance.terra-inst.public_ip
}

output "PrivateIP" {
  value = aws_instance.terra-inst.private_ip
}