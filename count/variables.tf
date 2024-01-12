variable "instance_names" {
  type = list
  default = ["mongodb","redis","mysql","rabbitmq","catalogue","user","cart","shipping","payment","dispatch","web"]
}

variable "ami_id" {
  default = "ami-03265a0778a880afb"
}

variable "zone_id" {
  default = "Z05173601IP58I4SC18MS" # your zoin_id
}

variable "domain_name" {
  default = "devrobo.shop" # your domain name
}