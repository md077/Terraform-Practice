provider "aws" {
  
}

resource "aws_instance" "dev" {
    ami = "ami-07ff62358b87c7116"
    instance_type = "t2.medium"
    tags = {
      Name = "devtest"
    }

  
}