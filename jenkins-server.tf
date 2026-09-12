data "aws_ami" "latest-ubuntu-image" {
    most_recent = true
    owners      = ["099720109477"]                   #Canonical's AWS account ID

       filter {
        name = "name"
        values = ["ubuntu/image/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
       }

       filter {
        name   = "virtualization-type"
        values = ["hvm"]
       }                 
}
resource "aws_instance" "myapp-server" {
    ami                          = data.aws_ami.latest-ubuntu-image.id
    instance_type                = var.instance_type
    key_name                     = "terraform"
    subnet_id                    = aws_subnet.myapp-subnet-1.id
    vpc_security_group_ids       = [aws_default_security_group.default-sg.id]
    availability_zone            = var.availability_zone
    associate_public_ip_address  = true
    user_data                    = file ("jenkins-server-script.sh")
    tags = {
        Name = "${var.env_prefix}-server"
    }
}
