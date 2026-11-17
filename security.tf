resource "aws_security_group" "app" {
  name        = "task-3-49-sg"
  description = "Flask port from the internet and outbound access so Fargate can pull the image"
  vpc_id      = module.vpc.vpc_id

  tags = {
    Name = "task-3-49-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "flask" {
  security_group_id = aws_security_group.app.id
  description       = "Flask from the internet"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 5000
  to_port           = 5000
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.app.id
  description       = "All outbound traffic"
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
