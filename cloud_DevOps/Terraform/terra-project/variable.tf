

variable "security_group" {
    
    description = "Security group for the EC2 instance"
    type        = string
  
}

variable "instance_type" {
    default = "t3.micro"
    type = string
}

variable "ec2_ami" {
    default = "ami-0360c520857e3138f"
    type = string
}

variable root_volume_size {
    default = 10
    type = number
}
  
variable volume_type {
    default = "gp3"
    type = string
}