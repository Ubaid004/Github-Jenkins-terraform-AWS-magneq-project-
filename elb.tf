resource "aws_elb" "zoro-elb" {
  name               = "zoro-elb"
  availability_zones = ["ap-south-1a", "ap-south-1b"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 5
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                 = ["${aws_instance.zoro.id}", "${aws_instance.nami.id}"]
  cross_zone_load_balancing = true
  idle_timeout              = 400
  tags = {
    Name = "Zoro-elb"
  }
}
