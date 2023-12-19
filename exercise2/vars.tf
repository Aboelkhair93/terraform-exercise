variable "REGION" {
  default = "us-east-1"
}
variable "ZONE1" {
  default = "us-east-1a"
}
variable "AMIS" {
  type = map(any)
  default = {
    #us-east-2 = "ami-0ee4f2271a4df2d7d"
    us-east-1 = "ami-0759f51a90924c166"
  }
}