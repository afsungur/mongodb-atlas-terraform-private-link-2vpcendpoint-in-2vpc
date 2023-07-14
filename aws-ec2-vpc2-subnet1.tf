// Creates an EC2 instance in the VPC secondary 
resource "aws_instance" "linux-server-2" {
  ami                         = data.aws_ami.amazon-linux-2.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.vpc-02-az1.id
  vpc_security_group_ids      = [aws_security_group.vpc-02_default.id]
  associate_public_ip_address = var.linux_associate_public_ip_address
  source_dest_check           = false 
  key_name                    = var.key_pair_name
  user_data                   = file("aws-ec2-user-data.sh")

  tags = {
    terraform = "true"
    Name = "mongo-client-02"
  }
}
