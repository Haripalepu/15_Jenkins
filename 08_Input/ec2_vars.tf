resource "aws_instance" "Jenkins_Input" {  
  ami           = "ami-0f3c7d07486cad139" #devops-practice ami
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.Jenkins_input_sg.id]

  tags = {
    Name = "Jenkins_Input" #Ec2 Instance name 
  }
}


resource "aws_security_group" "Jenkins_input_sg" {
  name        = var.sg-name
  description = var.sg-description
  #vpc_id      = aws_vpc.main.id
                                  
  ingress {
    description      = "TLS from VPC"
    from_port        = var.from-port
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = var.cidr_range
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Jenkins_input_sg"
  }
}