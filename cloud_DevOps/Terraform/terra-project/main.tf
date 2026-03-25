# keypair


resource "aws_key_pair" "my_key" {
  key_name   = "my_key_pair"
  public_key = file("my_key_pair.pub")
}


# vpc

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC-terra"
  }
}
# security group 
resource "aws_security_group" "terra-sg" {
  name        = "instance-sg"
  description = "terrafoem security group"
  vpc_id      = aws_default_vpc.default.id

  tags = {
    Name = "instance-sg"
  }

    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}





# ec2 instance 
resource "aws_instance" "terra-instance" {
  ami                         = "ami-0ecb62995f68bb549" # ubuntu AMI (HVM), SSD Volume Type
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.my_key.key_name
  vpc_security_group_ids      = [aws_security_group.terra-sg.id]

  tags = {
    Name = "terra-instance"
  }
  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.volume_type
  }
  user_data = file("InstallNginx.sh")

}