output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "public_subnets" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "private_subnets" {
  description = "List of private subnet IDs"
  value       = aws_subnet.private[*].id
}

output "public_instance_ips" {
  description = "Public IPs of the public EC2 instances"
  value       = aws_instance.public[*].public_ip
}

output "private_instance_ips" {
  description = "Private IPs of the private EC2 instances"
  value       = aws_instance.private[*].private_ip
}
