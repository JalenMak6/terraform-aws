resource "aws_ami_from_instance" "webserver" {
  name               = "webserver"
  source_instance_id = aws_instance.tf_ec2_2.id
}

resource "aws_launch_configuration" "as_conf" {
  name_prefix          = "web_config"
  image_id      = aws_ami_from_instance.webserver.id
  instance_type = "t2.micro"
  security_groups = [aws_security_group.terraform_security_group.id]

  user_data = <<-EOF
              #!/bin/bash
              echo $(hostname) > /var/www/html/index.html
              systemctl reload httpd
              EOF

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_group" "web-asg" {
  name_prefix = "asg for web"
  launch_configuration = aws_launch_configuration.as_conf.name
  # availability_zones = var.az
  desired_capacity   = 2
  max_size           = 4
  min_size           = 2
  health_check_type = "ELB"
  vpc_zone_identifier = [aws_subnet.public_subnet[0].id,aws_subnet.public_subnet[1].id, aws_subnet.public_subnet[2].id]

}