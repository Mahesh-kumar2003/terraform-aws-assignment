resource "aws_instance" "web" {

  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id = var.subnet_id

  associate_public_ip_address = true

  vpc_security_group_ids = [
    var.security_group_id
  ]

  user_data = <<-EOF
              #!/bin/bash
              apt update -y
              apt install apache2 -y
              echo "<h1>Hello from Terraform Module</h1>" > /var/www/html/index.html
              systemctl enable apache2
              systemctl start apache2
              EOF

  tags = {
    Name = "${var.project_name}-ec2"
  }
}