resource "aws_route_table" "tf_route_table" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    
    gateway_id = aws_internet_gateway.gw.id
  }


  tags = {
    Name = "tf_default_route"
  } 
}