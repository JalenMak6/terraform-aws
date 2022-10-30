resource "aws_lb" "alb" {
    name = "alb-for-web"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.terraform_security_group.id]
    subnets = [for subnet in aws_subnet.public_subnet : subnet.id]

    
    tags = {
        Environment = "dev_env"
  }
}

resource "aws_lb_target_group" "target_group"{
    name = "tg-for-alb"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.terraform_vpc.id

}

resource "aws_lb_target_group_attachment" "alb-target-attachment1" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.tf_ec2_1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "alb-target-attachment2" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.tf_ec2_2.id
  port             = 80
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}




