resource "aws_lb_listener" "nginx_listener" {
  load_balancer_arn = aws_lb.nginx_load_balancer.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.nginx-tg.arn
  }
}

resource "aws_lb_listener" "apache_listener" {
  load_balancer_arn = aws_lb.apache_load_balancer.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.apache-tg.arn
  }
}