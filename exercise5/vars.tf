variable REGION {
  default = "us-east-2"
}

variable ZONE1 {
  default = "us-east-2a"
}

variable AMIS {
  type = map(any)
  default = {
    us-east-2 = "ami-03657b56516ab7912"
    us-east-1 = "ami-0c7217cdde317cfec"
  }
}

variable USER {
  default = "ubuntu"
}