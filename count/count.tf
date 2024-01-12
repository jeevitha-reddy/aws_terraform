resource "aws_instance" "web" {
  #count = 11 # all will create same name
  count = length(var.instance_names)
  ami           = var.ami_id #devops-practice
  
  # count.index is a special variable given by terraform
  instance_type = var.instance_names[count.index] == "mongodb" || var.instance_names[count.index] == "mysql" || var.instance_names[count.index] == "shipping" ? "t3.small" : "t2.micro"
  tags = {
    Name = var.instance_names[count.index]
  }
}

#create instance and update r53 records

resource "aws_route53_record" "www" {
  #count = 11
  count = length(var.instance_names) #length function
  zone_id = var.zone_id
  name    = "${var.instance_names[count.index]}.${var.domain_name}" #interpolation
  type    = "A"
  ttl     = 1
  records = [var.instance_names[count.index] == "web" ? aws_instance.web[count.index].public_ip : aws_instance.web[count.index].private_ip]
}