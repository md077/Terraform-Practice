variable "ami-id" {
  
  description = "inserting ami values to main.tf"
  type = string
  default = "ami-07ff62358b87c7116"
}
variable "type" {

    type = string
    default = "t3.micro"
  
}