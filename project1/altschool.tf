data "aws_ami" "dev-server" {
  most_recent = true
  owners = ["099720109477"]

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}
resource "aws_key_pair" "terrakey" {
    key_name = "altschool_key"
    public_key = file("~/.ssh/cloudkey.pub")
}
resource "aws_instance" "isaacCloud-1" {
    ami = data.aws_ami.dev-server.id
    instance_type = "t2.micro"

    tags = {
        name = "server-1"
    } 
    key_name = aws_key_pair.terrakey.id 
}