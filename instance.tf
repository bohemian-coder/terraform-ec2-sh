resource "aws_key_pair" "mterrakey" {
  key_name   = "terra-key"
  public_key = file("terrakey.pub")
}
resource "aws_instance" "mterra-instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.mterrakey.key_name
  vpc_security_group_ids = ["sg-0e94a5ccf28e715ea"] #create security group on AWS console
  tags = {
    Name    = "Terra-Instance"
    Project = "TFProj"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  connection {
    user        = var.USER
    private_key = file("terrakey")
    host        = self.public_ip
  }
}