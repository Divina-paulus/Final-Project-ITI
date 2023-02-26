# security group 
resource "aws_security_group" "sg" {
  name        = "security-group"
  description = "security-group"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security-group"
  }
}
#instance
resource "aws_instance" "public-ec2" {
  ami                         = "ami-0557a15b87f6559cf"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public-us-east-1a.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  key_name                    = "final-iti"

  tags = {
    Name = "jump-host"
  }
}
