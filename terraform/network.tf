resource "aws_vpc" "exam-vpc" {
  cidr_block           = "172.31.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_classiclink   = false
  instance_tenancy     = "default"

  tags = {
    "Name" = "exam-vpc"
  }
}

resource "aws_subnet" "exam-subnet-public-1" {
  vpc_id                  = aws_vpc.lesson12-vpc.id
  cidr_block              = "172.31.0.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1a"

  tags = {
    "Name" = "exam-subnet-public-1"
  }
}

resource "aws_subnet" "exam-subnet-public-2" {
  vpc_id                  = aws_vpc.lesson12-vpc.id
  cidr_block              = "172.31.16.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1b"

  tags = {
    "Name" = "exam-subnet-public-2"
  }
}

resource "aws_internet_gateway" "exam-gateway" {
  vpc_id = aws_vpc.exam-vpc.id

  tags = {
    "Name" = "exam-gateway"
  }
}

resource "aws_route_table" "exam-routetable" {
  vpc_id = aws_vpc.exam-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.exam-gateway.id
  }

  tags = {
    Name = "exam-routetable"
  }
}

resource "aws_route_table_association" "exam-crta-public-subnet-1" {
  subnet_id      = aws_subnet.exam-subnet-public-1.id
  route_table_id = aws_route_table.exam-routetable.id
}

resource "aws_route_table_association" "exam-crta-public-subnet-2" {
  subnet_id      = aws_subnet.exam-subnet-public-2.id
  route_table_id = aws_route_table.exam-routetable.id
}

esource "aws_security_group" "exam-securitygroups" {
  vpc_id = aws_vpc.exam-vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 3389
    to_port = 3389
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 5985
    to_port = 5985
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 5986
    to_port = 5986
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "exam-securitygroups"
  }
}


