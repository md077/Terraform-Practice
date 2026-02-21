resource "aws_instance" "dev" {
    ami = "ami-07ff62358b87c7116"
    instance_type = "t3.medium"

     tags = {
        Name = "dev"
    }

    lifecycle {
      #prevent_destroy = true
      create_before_destroy = true
      ignore_changes = [ tags,]

    }
  
}