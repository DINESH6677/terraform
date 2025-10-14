resource "aws_instance" "terraform" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all1.id]

  tags = {
    Name = "terraform"
    Terraform = "true"
  }
}

resource "aws_security_group" "allow_all1" {
  name        = "allow-all1"
  description = "Allow all inbound traffic and all outbound traffic"

  egress {
    from_port        = 0 # from_port 0 to_port 0 means all ports
    to_port          = 0
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
  }

  ingress {
    from_port        = 0 # from_port 0 to_port 0 means all ports
    to_port          = 0
    protocol         = "-1" # -1 means all protocols
    cidr_blocks      = ["0.0.0.0/0"] # internet
  }
 

  tags = {
    Name = "allow-all1"
  }
}