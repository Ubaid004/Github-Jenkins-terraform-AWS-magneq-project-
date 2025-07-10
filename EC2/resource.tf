resource "aws_instance" "myinstance" {
  ami           =  var.myamiid
  instance_type = var.myinstype
  key_name = var.key-name              
  tags = {
    Name = "Zoro-terra"
  }
}
