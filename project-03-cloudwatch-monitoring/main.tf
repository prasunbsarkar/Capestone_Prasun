provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "monitoring_ec2" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type  = "t2.micro"

  tags = {
    Name = "CloudWatch-Monitoring-EC2"
  }
}

resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "EC2-High-CPU-Alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name        = "CPUUtilization"
  namespace          = "AWS/EC2"
  period            = 300
  statistic          = "Average"
  threshold          = 70
  alarm_description  = "Alarm when EC2 CPU exceeds 70%"

  dimensions = {
    InstanceId = aws_instance.monitoring_ec2.id
  }
}
