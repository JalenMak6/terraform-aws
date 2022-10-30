resource "aws_instance" "tf_ec2_1" {
  ami           = "ami-026b57f3c383c2eec" # us-east-1
  instance_type = "t2.micro"
  network_interface {
    network_interface_id = aws_network_interface.nic_ec2_1.id
    device_index         = 0
  }
  #user data
  user_data = <<EOF
    #!/bin/bash
    sudo su
    yum install httpd -y
    echo $(hostname) >> /var/www/html/index.html
    systemctl enable --now httpd    
    EOF
  tags = {
    Name = "tf_ec2_1"
  }

}

resource "aws_instance" "tf_ec2_2" {
  ami           = "ami-026b57f3c383c2eec" # us-east-1
  instance_type = "t2.micro"
  network_interface {
    network_interface_id = aws_network_interface.nic_ec2_2.id
    device_index         = 0
  }
  user_data = <<EOF
    #!/bin/bash
    sudo su
    yum install httpd -y
    echo $(hostname) >> /var/www/html/index.html
    systemctl enable --now httpd    
    EOF
  tags = {
    Name = "tf_ec2_2"
  }

}

