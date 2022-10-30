resource "aws_subnet" "private_subnet_1" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "10.10.10.0/24"

  tags = {
    Name = "private_subnet_1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "10.10.11.0/24"

  tags = {
    Name = "private_subnet_2"
  }
}

resource "aws_subnet" "private_subnet_3" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "10.10.12.0/24"

  tags = {
    Name = "private_subnet_3"
  }
}