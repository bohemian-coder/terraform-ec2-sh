resource "aws_key_pair" "mterrakey" {
  key_name   = "terra-key"
  public_key = file(var.PUB_KEY)
}
resource "aws_instance" "mterra-instance" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id = aws_subnet.terra-pub-1.id
  key_name               = aws_key_pair.mterrakey.key_name
  vpc_security_group_ids = [aws_security_group.terrasg.id]
  tags = {
    Name    = "Terra-Instance"
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
    private_key = file(var.PRIV_KEY)
    host        = self.public_ip
  }
}

resource "aws_ebs_volume" "terra_volume1" {
    availability_zone = var.ZONE1 #keep in the same zone as security group
    size = 3
    tags = {
      Name = "terra-volume1"
    }
}

resource "aws_volume_attachment" "volume1_attach" {
    device_name = "/dev/xvdh"
    volume_id = aws_ebs_volume.terra_volume1.id
    instance_id = aws_instance.mterra-instance.id
}

output "PublicIP" {
  value = aws_instance.mterra-instance.public_ip  
}

output "PrivateIP" {
  value = aws_instance.mterra-instance.private_ip  
}