# EC2 Instances in Public Subnets
resource "aws_instance" "public" {
  count                       = length(aws_subnet.public)
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public[count.index].id
  key_name                    = var.key_pair_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.public_sg.id]

  tags = {
    Name = "public_instance_${count.index + 1}"
  }
}

# EC2 Instances in Private Subnets
resource "aws_instance" "private" {
  count                  = length(aws_subnet.private)
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.private[count.index].id
  key_name               = var.key_pair_name
  vpc_security_group_ids = [aws_security_group.private_sg.id]

  tags = {
    Name = "private_instance_${count.index + 1}"
  }
}
