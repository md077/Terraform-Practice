# AWS Region
variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
  default     = "us-east-1"
}

# VPC
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name tag for VPC"
  type        = string
  default     = "dev-vpc"
}

# Subnets
variable "subnet1_cidr" {
  description = "CIDR block for subnet 1"
  type        = string
  default     = "10.0.0.0/24"
}

variable "subnet2_cidr" {
  description = "CIDR block for subnet 2"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet1_name" {
  description = "Name tag for subnet 1"
  type        = string
  default     = "dev-subnet-1"
}

variable "subnet2_name" {
  description = "Name tag for subnet 2"
  type        = string
  default     = "dev-subnet-2"
}

# Internet Gateway
variable "igw_name" {
  description = "Name tag for Internet Gateway"
  type        = string
  default     = "dev-igw"
}

# Route Table
variable "route_table_name" {
  description = "Name tag for route table"
  type        = string
  default     = "dev-rt"
}

# Security Group
variable "sg_name" {
  description = "Name of the security group"
  type        = string
  default     = "dev-sg"
}

# EC2
variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-07ff62358b87c7116"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name tag for EC2 instance"
  type        = string
  default     = "dev-server"
}
