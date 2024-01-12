# locals is just like variable but it have extra capabilities
locals {
  name = "jeevitha"
  training = "terraform"
  instance_type = var.isProd ? "t3.small" : "t2.micro"
}