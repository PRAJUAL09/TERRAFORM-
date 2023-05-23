output "aws_vpc_id" {
  
 value = aws_vpc.test-vpc.id
  }

output "vpc_cidr" {
  value = aws_vpc.test-vpc.cidr_block
}

output "test-vpc" {
  value = aws_vpc.test-vpc
}