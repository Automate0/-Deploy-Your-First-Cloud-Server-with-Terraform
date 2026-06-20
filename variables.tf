variable "aws_region"{
  description ="AWS region to deploy resources"
  type = string
  default ="us-east-1"
}
variable"instance_name"{
  description="Name tag for the EC2 instance "
  type = string
  default="my-updated-server" 
}