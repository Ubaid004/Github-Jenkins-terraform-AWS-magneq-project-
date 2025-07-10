variable "myamiid" {
  description = "passing the amiid"
  type        = string
  default     = "ami-0f918f7e67a3323f0"
}
variable "key-name" {
  description = "giving the key name"
  type        = string
  default     = "Zorro"
}
variable "myinstype" {
  description = "passing the instance type"
  type        = string
  default     = "t2.micro"
}
variable "myaz" {
  description = "availibikty zone for instance"
  type        = string
  default     = "ap-south-1a"
}
