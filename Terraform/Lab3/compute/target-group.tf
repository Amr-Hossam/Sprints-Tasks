resource "aws_lb_target_group" "nginx-tg" {
  name     = "nginx-tg"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  health_check {
    interval = 30
    timeout = 5
    path = "/"
  }
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group" "apache-tg" {
  name     = "apache-tg"
  port     = 80
  protocol = "HTTP"
  target_type = "instance"
  vpc_id   = var.vpc_id
  health_check {
    interval = 30
    timeout = 5
    path = "/"
  }
  # vpc_id   = var.vpc_id
}



resource "aws_lb_target_group_attachment" "nginx1_attachment" {
  target_group_arn = aws_lb_target_group.nginx-tg.arn
  target_id = aws_instance.public-nginx1.id
}
resource "aws_lb_target_group_attachment" "nginx2_attachment" {
  target_group_arn = aws_lb_target_group.nginx-tg.arn
  target_id = aws_instance.public-nginx2.id
}

resource "aws_lb_target_group_attachment" "apache1_attachment" {
  target_group_arn = aws_lb_target_group.apache-tg.arn
  target_id = aws_instance.private-apache1.id
}
resource "aws_lb_target_group_attachment" "apache2_attachment" {
  target_group_arn = aws_lb_target_group.apache-tg.arn
  target_id = aws_instance.private-apache2.id
}