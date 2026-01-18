# Creation of VPC
resource "aws_vpc" "dev_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

# Creation of subnet 1 (Public)
resource "aws_subnet" "dev_subnet1" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.subnet1_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet1_name
  }
}

# Creation of subnet 2 (Public)
resource "aws_subnet" "dev_subnet2" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = var.subnet2_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet2_name
  }
}

# Internet Gateway
resource "aws_internet_gateway" "dev_igw" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = var.igw_name
  }
}

# Route Table
resource "aws_route_table" "dev_rt" {
  vpc_id = aws_vpc.dev_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_igw.id
  }

  tags = {
    Name = var.route_table_name
  }
}

# Route Table Associations
resource "aws_route_table_association" "dev_rt_assoc1" {
  subnet_id      = aws_subnet.dev_subnet1.id
  route_table_id = aws_route_table.dev_rt.id
}

resource "aws_route_table_association" "dev_rt_assoc2" {
  subnet_id      = aws_subnet.dev_subnet2.id
  route_table_id = aws_route_table.dev_rt.id
}

# Security Group
resource "aws_security_group" "dev_sg" {
  name   = var.sg_name
  vpc_id = aws_vpc.dev_vpc.id

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

  ingress {
    from_port   = 443
    to_port     = 443
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
    Name = var.sg_name
  }
}

# EC2 Instance
resource "aws_instance" "dev_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.dev_subnet1.id
  vpc_security_group_ids = [aws_security_group.dev_sg.id]

  tags = {
    Name = var.instance_name
  }
}
