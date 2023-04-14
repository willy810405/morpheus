resource "aws_instance" "terraform_start_app_server" {
  ami           = "${var.ami_id}"
  instance_type = "t2.micro"

  tags = {
    Name = "${var.instance_name}"
  }
}
